within HelmholtzMedia.Interfaces.PartialHelmholtzMedium.Transport;
function thermalConductivity
  "This file is part of the HelmholtzCool application
  Copyright (C) 2008-2021  Carlos Trujillo Gonzalez
    
  This program is free software; you can redistribute it and/or
  modify it under the terms of the GNU General Public License version 3
  as published by the Free Software Foundation
    
  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
    
  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA."
	
  input ThermodynamicState state;
  output ThermalConductivity lambda;
  output ThermalConductivity lambda0;
  output ThermalConductivity lambdar;
  output ThermalConductivity lambdac;

protected
  Real MM = fluidConstants[1].molarMass;
  Real DM=state.d/MM "molar density mol/m3";
  Integer diluteModel=thermalConductivityCoefficients.diluteModel;
  Integer residualModel=thermalConductivityCoefficients.residualModel;
  Integer criticalModel=thermalConductivityCoefficients.criticalModel;
  Real[size(thermalConductivityCoefficients.an, 1),2] an=thermalConductivityCoefficients.an;
  Real[size(thermalConductivityCoefficients.ad, 1),2] ad=thermalConductivityCoefficients.ad;
  Real tau=0 "reduced temperature";
  Real delta=0 "reduced density";
  Real eta=0 "viscosity";
  Real eta0=0 "dilute viscosity";
  Real[size(thermalConductivityCoefficients.b, 1),5] b=thermalConductivityCoefficients.b;
  Real vp "vapor pressure at state.T";
  Real Tc=fluidConstants[1].criticalTemperature;
  Real Pc=fluidConstants[1].criticalPressure;
  Real Vc=fluidConstants[1].criticalMolarVolume;
  Real DMc=1/fluidConstants[1].criticalMolarVolume;
  Real Tref;
  Real tauRef;
  Real dDM_dP "pressure derivative w.r.t. molar density at state.T";
  Real dDMref_dP "pressure derivative w.r.t. molar density at Tref" ;
  Real zetaBase;
  Real zeta;
  Real qDz;
  Real cp;
  Real cv;
  Real omega;
  Real omega0;
  Real b1[:];
  Real c1[:];
  Real r;
  Real s;
  Real coef[7,4];
  Real B[7];
  Real mu=fluidConstants[1].dipoleMoment;
  Real y,muR,muR4,G1,G2,f;
algorithm
  assert(state.phase <> 2, "thermalConductivity warning: property not defined in two-phase region", level=AssertionLevel.warning);
  
  //dilute calculation
  if diluteModel==2 then
  //rational polynomia
    tau:=state.T/thermalConductivityCoefficients.diluteTred;
    lambda0:=sum(an[i, 1]*(tau)^an[i, 2] for i in 1:size(an, 1))/sum(ad[i, 1]*(tau)^ad[i, 2] for i in 1:size(ad, 1));
  elseif diluteModel==3 then
    //eta0 and polynomial
    (eta,eta0):=dynamicViscosity(state);
    tau:=Tc/state.T;
    lambda0:=eta0*1e6*an[1,1];
    lambda0:=lambda0+sum(an[i, 1]*(tau)^an[i, 2] for i in 2:size(an, 1));
  elseif diluteModel==10 then
    //T correlation
      lambda0:=physPropCorr(thermalConductivityCoefficients.corrG,thermalConductivityCoefficients.coefG,MM*1000,state.T);
  elseif diluteModel==1 then
    if mediumName=="carbondioxide" then
      b1:={0.4226159, 0.6280115, -0.5387661, 0.6735941, 0, 0, -0.4362677, 0.2255388};
      c1:={0, 2.387869e-2, 4.350794, -10.33404, 7.981590, -1.940558};
      tau:=state.T/251.196;
      r:=sum(c1[i]*(state.T/100)^(3-i) for i in 2:size(c1,1));
      r:=(2*(1.0 + exp(-183.5/state.T)*r)/5)^0.5;
      s:=sum(b1[i]*tau^(-i+1) for i in 1:size(b1,1));
      lambda0:=0.475598e-3*state.T^0.5*(1+r*r)/s;
    elseif mediumName=="ethane" then
      delta:=DM/DMc;
      tau := 305.33/state.T;
      r:=1.7104147-0.6936482*245/state.T;
      (eta,eta0):=dynamicViscosity(state);
      lambda0 := 0.276505e-3*(eta0*1e6)*(3.75-r*(tau*tau*EoS.f_itt(delta,tau)+1.5));
    elseif mediumName=="helium" then
      /*if state.T<300 then
        tau:=log(state.T);
        lambda0:=0.1*exp(-4.3611622157+1.9250159286*tau-0.52544120165*tau^2+ 0.090045763885*tau^3-0.0054773874708*tau^4);
      else
        lambda0:=0.1*(1.53220256*state.T^0.71938)*exp(12.451/state.T-295.67/state.T^2-4.1249)-0.001083;
      end if;//McCarty 1972*/
      lambda0:=2.7870034e-3*state.T^0.7034007057*exp(3.739232544/state.T-2.620316969e1/state.T^2+5.982252246e1/state.T^3-4.926397634e1/state.T^4);
    else
      assert(false,"dilute hardcoded thermal conductivity not found");
    end if;
  elseif diluteModel==0 then
    lambda0:=0;
  end if;
    
  //residual calculation
  if residualModel==2 then
  //polynomial
    tau:=thermalConductivityCoefficients.residualTred/state.T;
    delta:=state.d/thermalConductivityCoefficients.residualDred;
    lambdar:=sum(b[i, 1]*(tau)^b[i, 2]*(delta)^b[i,3] for i in 1:size(b, 1));
  elseif residualModel==3 then
  //polynomial and exponential
    tau:=Tc/state.T;
    delta:=DM/DMc;
    lambdar:=sum(b[i, 1]*(tau)^b[i, 2]*(delta)^b[i,3]*exp(-b[i,4]*delta^b[i,5]) for i in 1:size(b, 1));
  elseif residualModel==4 then
    //polynomial2
    tau:=state.T/thermalConductivityCoefficients.residualTred;
    delta:=state.d/thermalConductivityCoefficients.residualDred;
    lambdar:=sum((b[i, 1]+b[i, 2]*tau)*delta^i for i in 1:size(b, 1))*1e-3;
  elseif residualModel==1 then
    if mediumName=="helium" then
    //McCarty 1972
      if state.T<300 then
        tau:=log(state.T);
        r:=exp(4.7470660612- 5.3641468153*tau+3.4639703698*tau^2-1.0702455443*tau^3+0.1571349306*tau^4-0.0089214004*tau^5);
        s:=2.2109006708+187.74174808/state.T-1281.0947055/state.T^2 + 3645.2393216/state.T^3-3986.6937948/state.T^4;
        lambdar:=lambda0*(exp(r*1e-3*state.d+s*1e-6*state.d^2)-1);
      else
        lambdar:=0.154687*(exp(2.01941e-3*state.d+2.82261e-6*state.d^2)-1);
      end if;
    else
      assert(false,"residual hardcoded thermal conductivity not found");
    end if;
  elseif residualModel==10 then
    //Saturated liquid correlation without pressure correction, and low density value with Chung's density correction
    vp:=saturationPressure(state.T);    
    if state.T<=Tc and state.p>=vp then
      //liquid
      lambdar:=physPropCorr(thermalConductivityCoefficients.corrL,thermalConductivityCoefficients.coefL,MM*1000,state.T)-lambda0;
    else
      //dilute conductivity with density correction according to Chung
      coef:={{2.4166,7.4824e-1,-9.1858e-1,1.2172e2}, {-5.0924e-1,-1.5094,-4.9991e1,6.9983e1}, {6.6107,5.6207,6.4760e1,2.7039e1},{1.4543e1,-8.9139,-5.6379,7.4344e1}, {7.9274e-1,8.2019e-1,-6.9369e-1,6.3173}, {-5.8634,1.2801e1,9.5893,6.5529e1}, {9.1089e1,1.2811e2,-5.4217e1,5.2381e2}};
      tau:=state.T / Tc;
      y:=Vc*state.d/(6* MM);
      G1:=(1-0.5*y)/(1-y)^3;
      muR:= if mu >0 then 131.3 * mu / (Vc * 1e6 * Tc) ^ 0.5 else 0.0;
      muR4:=muR*muR*muR*muR;
      for i in 1:7 loop
        B[i]:=coef[i,1]+coef[i,2]*fluidConstants[1].acentricFactor+coef[i,3]*muR4+coef[i,4]*thermalConductivityCoefficients.kappa;
      end for;
      G2:=(B[1]*(1-exp(-B[4]*y))/y+B[2]*G1*exp(B[5]*y)+B[3]*G1)/(B[1]*B[4]+B[2]+B[3]);
      lambdar:=lambda0*((1/G2+B[6]*y)-1)+3.586e-3*(Tc/MM)^0.5*B[7]*y*y*tau^0.5*G2/(Vc*1e6)^0.6667;
      if lambdar<0 then
        lambdar:=0;
      end if;
    end if;  
  elseif residualModel==0 then
    lambdar:=0;
  else
    lambdar:=0;
  end if;
  
  //critical calculation
  if criticalModel==2 then
  //simplified Olchowy Sengers
    tau:=Tc/state.T;
    delta:=DM/DMc;
    Tref:=if thermalConductivityCoefficients.Tref>0 then thermalConductivityCoefficients.Tref else 1.5*Tc;
    tauRef:=Tc/Tref;
    dDM_dP:=1/(Modelica.Constants.R*state.T*(1+2*delta*EoS.f_rd(delta,tau)+delta^2*EoS.f_rdd(delta,tau)));
    dDMref_dP:=1/(Modelica.Constants.R*Tref*(1+2*delta*EoS.f_rd(delta,tauRef)+delta^2*EoS.f_rdd(delta,tauRef)));
    zetaBase:=(Pc*delta/(thermalConductivityCoefficients.Gamma*DMc))*(dDM_dP-Tref*dDMref_dP/ state.T);
    if zetaBase>0 then
      zeta:=thermalConductivityCoefficients.zeta0*zetaBase^(thermalConductivityCoefficients.nu/thermalConductivityCoefficients.gamma);
      qDz:=thermalConductivityCoefficients.qD*zeta;
      cv:=-Modelica.Constants.R*tau^2*(EoS.f_itt(delta,tau)+EoS.f_rtt(delta,tau));
      cp:=cv+Modelica.Constants.R*(1+delta*(EoS.f_rd(delta,tau)-tau*EoS.f_rtd(delta,tau)))^2/(1+delta*(2*EoS.f_rd(delta,tau)+delta*EoS.f_rdd(delta,tau)));
      eta:=dynamicViscosity(state);
      omega:=2.0/Modelica.Constants.pi*((cp-cv)/cp*atan(qDz)+cv*qDz/cp);
      omega0:=2.0/Modelica.Constants.pi*(1.0-exp(-1.0/(1.0/qDz+1.0/3.0*qDz*qDz/delta/delta)));
      lambdac:=DM*cp*thermalConductivityCoefficients.Rd*Modelica.Constants.k*state.T*(omega-omega0)/(6*Modelica.Constants.pi*eta*zeta);
    else
      lambdac:=0;
    end if;
  elseif criticalModel==1 then
    if mediumName=="carbondioxide" then
      tau:=state.T/304.1282;
      delta:=state.d/467.6;
      b1:={3.0, 6.70697, 0.94604, 0.30, 0.30, 0.39751, 0.33791, 0.77963, 0.79857, 0.90, 0.02, 0.20};
      r:=1-b1[10]*Modelica.Math.acosh(1+b1[11]*((1-tau)^2)^b1[12]);
      s:=delta*exp(-delta^b1[1]/b1[1]-(b1[2]*(tau-1))^2-(b1[3]*(delta-1))^2);
      y:=(1-1/tau)+b1[4]*((delta-1)^2)^(0.5/b1[5]);
      f:=((y^2)^b1[6] + ((b1[7]*(delta-r))^2)^b1[8])^b1[9];
      lambdac:=0.775547504e-3*4.81384*s/f;
    end if;
  else
    lambdac:=0;
  end if;
  lambda:=lambda0+lambdar+lambdac;
  //assert(false,"Th.cond.: "+String(lambda0)+"  "+String(lambdar)+"  "+String(lambdac),AssertionLevel.warning);
end thermalConductivity;

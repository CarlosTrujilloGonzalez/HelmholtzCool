within HelmholtzMedia.Interfaces.PartialHelmholtzMedium.Transport;
  function dynamicViscosity
  "This file is part of the HelmholtzCool application
  Copyright (C) 2021  Carlos Trujillo Gonzalez
    
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
    output DynamicViscosity eta;
    output DynamicViscosity eta0;
    output DynamicViscosity etai;
    output DynamicViscosity etar;
  protected
    MolarMass MM = fluidConstants[1].molarMass;
    Real DM=state.d/MM "molar density mol/m3";
    Integer diluteModel=dynamicViscosityCoefficients.diluteModel;
    Integer initialModel=dynamicViscosityCoefficients.initialModel;
    Integer residualModel=dynamicViscosityCoefficients.residualModel;
    Real epsilon=dynamicViscosityCoefficients.epsilon;
    Real sigma=dynamicViscosityCoefficients.sigma "nm";
    Real Tc=fluidConstants[1].criticalTemperature;
    Real Vc=fluidConstants[1].criticalMolarVolume;
    Real tau=0 "reduced temperature";
    Real delta=0 "reduced density"; 
    Real[size(dynamicViscosityCoefficients.a, 1),2] a=dynamicViscosityCoefficients.a;
    Real omega "collision integral";
    Real g[11];
    Real r[11];
    Real s[11];
    Real[size(dynamicViscosityCoefficients.b, 1),3] b=dynamicViscosityCoefficients.b;
    Real Bi "m3/mol";
    Real A,B,C,D,E,F,X,Y;
    Real[size(dynamicViscosityCoefficients.dp, 1),5] dp=dynamicViscosityCoefficients.dp;
    Real[size(dynamicViscosityCoefficients.bl, 1),3] bl=dynamicViscosityCoefficients.bl;
    Real[size(dynamicViscosityCoefficients.b0n, 1),2] b0n=dynamicViscosityCoefficients.b0n;
    Real[size(dynamicViscosityCoefficients.b0d, 1),2] b0d=dynamicViscosityCoefficients.b0d;
    Real psi1,psi2;
    Real ka,kdr,ki,kaa,kdrdr,kii "coefficients for residual viscosity calculation in frictiontheory";
    Real pr,pa,pid,dPr "repulsive, attractive, ideal and diferential pressures in bars";
    Real mu=fluidConstants[1].dipoleMoment;
    Real w;
    Real muR, muR4 "reduced dipole moment, and its four power";
    Real kappa;
    Real Fc;
    Real coef[10,4];
    Real EE[10];
    Real eta1, eta2;
    Real vp,Zc,Z1,Z2,Pr;
  algorithm
  
    //dilute viscosity calculation
    if diluteModel==2 then
    //collision integral
      tau:=log(state.T/epsilon);
      omega:=exp(sum(a[i, 1]*(tau)^a[i, 2] for i in 1:size(a, 1)));
      eta0:=dynamicViscosityCoefficients.diluteLead*(1000*MM*state.T)^0.5/(sigma^2*omega);
    elseif diluteModel==3 then
    //kinetic theory
      tau:=state.T/epsilon;
      omega:=1.16145/tau^0.14874 + 0.52487*exp(-0.77320*tau) + 2.16178*exp(-2.43787*tau);
      eta0:=26.692E-3*(1000*MM*state.T)^0.5/(sigma^2*omega);
    elseif diluteModel==4 then
    //powers of T
      eta0:=sum(a[i, 1]*(state.T)^a[i, 2] for i in 1:size(a, 1));
    elseif diluteModel==5 then
    //powers of Tr
      tau:=state.T/dynamicViscosityCoefficients.diluteTred;
      eta0:=sum(a[i, 1]*(tau)^a[i, 2] for i in 1:size(a, 1));
    elseif diluteModel==6 then
    //Chung
      if dynamicViscosityCoefficients.MM>0 then
        MM:=dynamicViscosityCoefficients.MM;
      end if;
      if dynamicViscosityCoefficients.diluteTred>0 then
        Tc:=dynamicViscosityCoefficients.diluteTred;
      end if;
      if dynamicViscosityCoefficients.residualDMred>0 then
        Vc:= 1/dynamicViscosityCoefficients.residualDMred;
      end if;
      if dynamicViscosityCoefficients.dipole>0 then
        mu:= dynamicViscosityCoefficients.dipole;
      end if;
      w:= if dynamicViscosityCoefficients.acentric>0 then dynamicViscosityCoefficients.acentric else fluidConstants[1].acentricFactor; 
      kappa:= if dynamicViscosityCoefficients.kappa>0 then dynamicViscosityCoefficients.kappa else 0;
       
      tau:=1.2593 * state.T / Tc;
      muR := if mu >0 then 131.3 * mu / (Vc * 1e6 * Tc) ^ 0.5 else 0.0;
      muR4 := muR * muR * muR * muR;
      //omega := 1.16145 * tau ^ (-0.14874) + 0.52487 * exp(-0.7732 * tau) + 2.16178 * exp(-2.43787 * tau);
      omega:=1.16145*tau^(-0.14874) + 0.52487*exp(-0.77320*tau) + 2.16178*exp(-2.43787*tau)-6.435e-4*tau^0.14874*sin(18.0323*tau^(-0.76830) - 7.27371);
      Fc := 1 - 0.2756 * w + 0.059035 * muR4 + kappa;
      eta0:=4.0785e-10*(1000*MM*state.T)^0.5/(Vc^(2.0/3.0)*omega)*Fc "in Pa·s, not poises as Chung";
    elseif diluteModel==10 then
    //T correlation
      eta0:=physPropCorr(dynamicViscosityCoefficients.corrG,dynamicViscosityCoefficients.coefG,MM*1000,state.T);
    elseif diluteModel==1 then
      if mediumName=="cyclohexane" then
        B:=exp(-1.5093 + 364.87/state.T - 39537/state.T^2);
        eta0:=0.19592*state.T^0.5/B*1e-6;
      elseif mediumName=="ethane" then
        EE:={-3.0328138281, 16.918880086, -37.189364917, 41.288861858, -24.615921140, 8.9488430959, -1.8739245042, 0.20966101390, -9.6570437074e-3,0};
        tau:=state.T/245;
        omega:=sum(EE[i]*(tau)^((i-1)/3.0-1) for i in 1:size(EE, 1));
        eta0:=12.0085*tau^0.5*omega*1e-6;
      end if;
    elseif diluteModel==0 then
      eta0:=0;
    else
      assert(false,"Unknown dilute viscosity model");
    end if;
    
    //initial calculation
    if initialModel==2 then
    //Rainwater-Friend
      tau:=state.T/epsilon;
      Bi:= 6.022137e-4*sigma^3*sum(b[i, 1]*tau^b[i, 2] for i in 1:size(b, 1)) "m3/mol";
      etai:=eta0*Bi*DM;
    elseif initialModel==3 then
    //empirical
      tau:=dynamicViscosityCoefficients.initialTred/state.T;
      delta:=DM/dynamicViscosityCoefficients.initialDMred;
      etai:=sum(b[i, 1]*delta^b[i, 2]*tau^b[i,3] for i in 1:size(b, 1));
    elseif initialModel==0 then
      etai:=0;
    else
      assert(false,"Unknown initial viscosity model");
    end if;

    //residual calculation
    if residualModel==2 then
    //modified Batschinski-Hildebrand
      tau:=dynamicViscosityCoefficients.residualTred/state.T;
      delta:=DM/dynamicViscosityCoefficients.residualDMred;
      A:=sum(dp[i, 1]*delta^dp[i, 2]*tau^dp[i,3]*exp(dp[i,4]*delta^dp[i,5]) for i in 1:size(dp, 1)) "double polynomial part";
      B:=sum(bl[i, 1]*delta^bl[i, 2]*tau^bl[i,3] for i in 1:size(bl, 1)) "Batschinski lead";
      C:=sum(b0n[i, 1]*tau^b0n[i,2] for i in 1:size(b0n, 1)) "delta0 num";
      D:=sum(b0d[i, 1]*tau^b0d[i,2] for i in 1:size(b0d, 1)) "delta0 denom";
      etar:=A+B*(1/(C/D-delta)-D/C) "A+B*(1/(delta0-delta)-1/delta0)";
    elseif residualModel==3 then
    //friction theory
      tau:=dynamicViscosityCoefficients.residualTred/state.T;
      psi1:=exp(tau)-dynamicViscosityCoefficients.c1;
      psi2:=exp(tau^2)-dynamicViscosityCoefficients.c2;
      ka:=(bl[1,1]+bl[1,2]*psi1+bl[1,3]*psi2)*tau;
      kdr:=(bl[2,1]+bl[2,2]*psi1+bl[2,3]*psi2)*tau;
      ki:=(bl[3,1]+bl[3,2]*psi1+bl[3,3]*psi2)*tau;
      kaa:=(bl[4,1]+bl[4,2]*psi1+bl[4,3]*psi2)*tau^3;
      kdrdr:=(bl[5,1]+bl[5,2]*psi1+bl[5,3]*psi2)*tau^3;
      kii:=(bl[6,1]+bl[6,2]*psi1+bl[6,3]*psi2)*tau^3;
      tau:=Tc/state.T "redefinition of tau, now for the EOS";
      delta:=DM*fluidConstants[1].criticalMolarVolume;
      pr:=state.T*DM*Modelica.Constants.R*(1+delta*EoS.f_rd(delta,tau)-delta*tau*EoS.f_rtd(delta,tau))*1e-5;
      pid:=Modelica.Constants.R*DM*state.T*1e-5;
      pa:=state.p*1e-5-pr;
      dPr:=pr-pid;
      etar:=ka*pa+kdr*dPr+ki*pid+kaa*pa^2+kdrdr*dPr^2+kii*pid^2;
    elseif residualModel==6 then
    //Chung. Use always with diluteModel=6
      coef:={{6.32402,50.4119,-51.6801,1189.02},{1.2102e-3,-1.1536e-3,-6.2571e-3,0.037283}, {5.28346,254.209,-168.481,3898.27},{6.62263,38.0957,-8.46414,31.4178}, {19.7454,7.63034,-14.3544,31.5267}, {-1.89992,-12.5367,4.98529,-18.1507}, {24.2745,3.44945,-11.2913,69.3466},{0.79716,1.11764,0.012348,-4.11661}, {-0.23816,0.067695,-0.8163,4.02528},{0.068629,0.34793,0.59256,-0.72663}};    
      muR := if mu >0 then 131.3 * mu / (Vc * 1e6 * Tc) ^ 0.5 else 0.0;
      muR4 := muR * muR * muR * muR;
      for i in 1:10 loop
        EE[i]:=coef[i,1]+coef[i,2]*w+coef[i,3]*muR4+coef[i,4]*kappa;
      end for;
      A:=Vc*state.d/(6* MM);
      B:=(1-0.5*A)/(1-A)^3;
      C:=(EE[1]*((1-exp(-EE[4]*A))/A)+EE[2]*B*exp(EE[5]*A)+EE[3]*B)/(EE[1]*EE[4]+EE[2]+EE[3]);
      eta1 := eta0*(1/C + EE[6]*A);
      if eta1<0 then
        eta1:=0;
      end if;
      eta2:=36.344e-11*(1000*MM*Tc)^0.5/Vc^(2/3)*EE[7]*A*A*C*exp(EE[8]+EE[9]/tau+EE[10]/(tau*tau));
      etar:= eta1+eta2-eta0;
    elseif residualModel==10 then
      //From saturated liquid correlation and low pressure viscosity, using Lucas' pressure correction
      vp:=saturationPressure(state.T);
      tau:=state.T/Tc;    
      if state.T<=Tc and state.p>=vp then
      //Liquid
        etar:=physPropCorr(dynamicViscosityCoefficients.corrL,dynamicViscosityCoefficients.coefL,MM*1000,state.T);
        B:=(state.p-vp)/fluidConstants[1].criticalPressure;
        A := 0.9991 - 4.674e-4 / (1.0523 * tau ^ (-0.03877) - 1.0513);
        C := (-0.07921) + tau*(2.1616 + tau*( - 13.404 + tau*(44.1706 +tau*( - 84.8291 + tau*(96.1209 +tau*( - 59.8127  + tau*15.6719))))));
        D := 0.3257 / (1.0039 - tau ^ 2.573) ^ 0.2906 - 0.2086;
        etar := etar * (1 + D * (B / 2.118) ^ A / (1 + C * fluidConstants[1].acentricFactor * B))-eta0;
      else
        //Gas
        Pr:=state.p/fluidConstants[1].criticalPressure;
        Zc:=fluidConstants[1].criticalPressure*fluidConstants[1].criticalMolarVolume/(Tc*Modelica.Constants.R);
        muR := if mu>0 then 52.46 * mu * mu * fluidConstants[1].criticalPressure * 1e-5 / Tc^2 else 0;
        Fc:=if muR < 0.022 then 1.0 elseif muR < 0.075 then 1+30.55*(0.292-Zc)^1.72 else 1+30.55*(0.292-Zc)^1.72*abs(0.96+0.1*(tau-0.7));
        X := 0.176 * (Tc / (MM^3 * fluidConstants[1].criticalPressure^4 * 1e-11)) ^ 0.1666667 * 1e-7;
        Z1 := eta0 * X;
        if tau <= 1 then
          tau := 1;
        end if;
        A := 1.245e-3 * exp(5.1726 * tau ^ (-0.3286)) / tau;
        B := A * (1.6553 * tau - 1.2723);
        C := 0.4489 * exp(3.0578 * tau ^ (-37.7332)) / tau;
        D := 1.7368 * exp(2.231 * tau ^ (-7.6351)) / tau;
        E := 1.3088;
        F := 0.9425 * exp(-0.1853 * tau ^ 0.4489);
        Z2 := Z1 * (1 + A * Pr ^ E / (B * Pr ^ F + 1 / (1 + C * Pr ^ D)));
        Y := Z2 / Z1;
        Fc := (1 + (Fc - 1) * Y ^ (-3)) / Fc;
        etar := Z2 * Fc/ X-eta0;
      end if;
    elseif residualModel==1 then
    //hardcoded
      if mediumName=="helium" then
        X := if (state.T<=300) then log(state.T) else log(300);
        B := -47.5295259/X+87.6799309-42.0741589*X+8.33128289*X^2-0.589252385*X^3;
        C := 547.309267/X-904.870586+431.404928*X-81.4504854*X^2+5.37008433*X^3;
        D := -1684.39324/X+3331.08630-1632.19172*X+308.804413*X^2-20.2936367*X^3;
        E := -0.135311743/X+1.00347841+1.20654649*X-0.149564551*X^2+0.012520841*X^3;
        F := B*state.d*1e-3+C*state.d^2*1e-6+D*state.d^3*1e-9;
        if state.T<=100 then
          etar:=exp(E+F)*1e-7;
        else
          etar:=(exp(E+F)+196*state.T^0.71938*exp(12.451/state.T-295.67/state.T^2-4.1249)-exp(E))*1e-7;
        end if;
      elseif mediumName == "hydrogen" then
        tau:=state.T/33.145;
        delta:=state.d/90.5;
        etar:=6.43449673e-6*delta^2*exp(4.56334068e-2*tau+2.32797868e-1/tau+9.58326120e-1*delta^2/(1.27941189e-1+tau)+3.63576595e-1*delta^6);
      elseif mediumName == "benzene" then
        tau:=state.T/562.02; 
        delta:=state.d/304.792;
        etar:=delta^(2.0/3.0)*tau^0.5*(-9.98945*delta^2 + 86.0626*delta/(2.74872+1.1113*tau-delta) + (-134.133*delta-352.473*delta^2)/(6.60989+88.4174*delta^2))*1e-6;
      elseif mediumName == "ethane" then
        tau := 305.33/state.T;
        delta := DM/6870;
        r:={1,1,2,2,2,3,3,4,4,1,1};
        s:={0,1,0,1,1.5,0,2,0,1,0,1};
        g:={0.47177003, -0.23950311, 0.39808301, -0.27343335, 0.35192260, -0.21101308, -0.00478579, 0.07378129, -0.030435255, -0.30435286, 0.001215675};
        etar:=15.977e-6*sum(g[i]*delta^r[i]*tau^s[i] for i in 1:9)/(1+sum(g[i]*delta^r[i]*tau^s[i] for i in 10:11));    
      else
        assert(false,"residual hardcoded viscosity not found");
      end if;     
    elseif residualModel==0 then
      etar:=0;
    else
      assert(false,"Unknown dilute viscosity model");
    end if;
    eta:=eta0+etai+etar;
    //assert(false,"Viscosity: "+String(eta0)+"  "+String(etai)+"  "+String(etar),AssertionLevel.warning);
  annotation(
  Documentation(info = "<html>
<body>
<p>The friction theory implementation is as per Quiñones Cisneros et alt. 2006. the implementation in CoolProp is somewhat more flexible, but I wait to find the susbstance that needs this extra flexibility. In n-Pentane it is not necessary.</p>
</body>
  </html>"));
end dynamicViscosity;


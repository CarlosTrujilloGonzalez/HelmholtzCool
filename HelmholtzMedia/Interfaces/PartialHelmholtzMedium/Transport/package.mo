within HelmholtzMedia.Interfaces.PartialHelmholtzMedium;
package Transport
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
	
  record DynamicViscosityCoefficients
    constant Integer diluteModel=0 "0=no model, 1=hardcoded, 2=collision integral, 3=kinetic theory, 4=powers of T, 5=powers of Tr, 6=Chung, 10=from T correlation";
    constant Temperature epsilon=0 "Lennard-Jones energy parameter in K";
    constant Real sigma=0 "Lennard-Jones size parameter in nm";
    constant Real Fc= 1.0;
    constant Real diluteLead=1;
    constant Temperature diluteTred=0 "dilute reducing temperature";
    constant Real[:,2] a = fill(0.0, 0, 2) "dilute coefficients";
    constant Real acentric=0 "acentric factor for Chung calculation";
    constant Real dipole=0 "dipole moment for Chung method";
    constant Real kappa=0 "coefficient for Chung calculation";
    constant Real MM=0 "Molar mass kg/mol for Chung calculation";
    constant Integer corrG=0 "correlation for gas low density viscosity";
    constant Real[:] coefG = fill(0.0,0) "coefficients for gas low density viscosity";
  
    constant Integer initialModel=0 "0=no model, 1=hardcoded, 2=Rainwater-Friend, 3=empirical";  
    constant Temperature initialTred=0 "initial reducing temperature";
    constant Real initialDMred=0 "initial reducing molar density";
    constant Real[:,3] b = fill(0.0, 0, 3) "initial coefficients";  
  
    constant Integer residualModel=0 "0=no model, 1=hardcoded, 2=mod.Batschinski_Hildebrand, 3=friction theory, 6=Chung, 7=VS2, 8=residual s, 9= ECS, 10=from p and T correlation";
    constant Temperature residualTred=0 "residual reducing temperature";
    constant Real residualDMred=0 "residual reducing molar density";
    constant Real[:,5] dp =  fill(0.0, 0, 5) "coefficients for double polynomial part";
    constant Real[:,3] bl =  fill(0.0, 0, 3) "Batschinski part lead, or friction theory coefficients";
    constant Real[:,2] b0n =  fill(0.0, 0, 2) "Batschinski part delta0 num";
    constant Real[:,2] b0d =  fill(0.0, 0, 2) "Batschinski part delta0 denom";
    constant Real c1=1, c2=1 "coefficients for psi calculation in friction theory";
    constant Real C=1 "adjustable coefficient for gas residual entroy scaling";
    constant Real[:,2] clg =  fill(0.0, 0, 2) "liquid and gas coefficients for residual entropy scaling";
    constant Real rhoSrc=0 "rhoc * src";
    constant Real[:] nistCoeff = fill(0.0,0) "coefficients for reference density correction in ECS";
    constant Integer corrL=0 "correlation for liquid viscosity";
    constant Real[:] coefL = fill(0.0,0) "coefficients for liquid viscosity correlation";
 end DynamicViscosityCoefficients;
	
  record ThermalConductivityCoefficients
    constant Integer diluteModel=0 "0=no model, 1=hardcoded, 2=rational polynomia, 3=eta0 and polynomia, 9=ECS, 10=from T correlation";
    constant Temperature diluteTred=0 "dilute reducing temperature";
    constant Real[:,2] an = fill(0.0, 0, 2) "dilute coefficients num";
    constant Real[:,2] ad = fill(0.0, 0, 2) "dilute coefficients denom";
    constant Real[:] ai = fill(0.0,0) "coefficients for internal part of dilute conductivity";
    constant Integer corrG=0 "correlation for gas low density thermal conductivity";
    constant Real[:] coefG = fill(0.0,0) "coefficients for gas low density thermal conductivity";
   
    constant Integer residualModel=0 "0=no model, 1=hardcoded, 2=polynomial, 3=polynomial and exponential, 4=polynomial2, 9=ECS, 10=from p and T correlation";
    constant Temperature residualTred=0 "residual reducing temperature";
    constant Real residualDMred=0 "residual reducing molar density";
    constant Real residualDred=0 "residual reducing mass density";
    constant Real[:,5] b =  fill(0.0, 0, 5) "coefficients for residual part";
    constant Real[:] nistCoeff = fill(0.0,0) "coefficients for reference density correction in ECS";
    constant Integer corrL=0 "correlation for liquid thermal conductivity";
    constant Real[:] coefL = fill(0.0,0) "coefficients for liquid thermal conductivity";
    constant Real kappa=0 "coefficient for gas thermal conductivity correction as per Chung";
  
    constant Integer criticalModel=0 "0=no model, 1=hardcoded, 2=simplified Olchowy Sengers";
    constant Real Tref=0;
    constant Real Rd=1.03;
    constant Real qD=0;
    constant Real zeta0=0;
    constant Real Gamma=0;
    constant Real nu=0.63;
    constant Real gamma=1.239;
    
  end ThermalConductivityCoefficients;

  record SurfaceTensionCoefficients
    Temperature Tc=0.0;
    Real[:,2] coeffs = fill(0.0, 0, 2);
  end SurfaceTensionCoefficients;

  function surfaceTension "Return surface tension"
    input SaturationProperties sat;
    output SurfaceTension sigma;
  protected
    Temperature Tc=if surfaceTensionCoefficients.Tc>0 then surfaceTensionCoefficients.Tc else fluidConstants[1].criticalTemperature;
  algorithm
    sigma := sum(surfaceTensionCoefficients.coeffs[i, 1]*(1-sat.Tsat/Tc)^surfaceTensionCoefficients.coeffs[i, 2] for i in 1:size(surfaceTensionCoefficients.coeffs, 1));
  end surfaceTension;
  
  function conformalStateSolver
    input Real T;
    input Real rhoMolar;
    output Real T0;
    output Real DM0;
  protected
    Real delta, tau;
    Real V,error,errorOld;
    Real Arr,Z,tau0,delta0,Arr0,Z0,tau0Prev,delta0Prev,tau0Delta,delta0Delta;
    Real Z0t,Z0d "Z derivatives regarding tau and delta";
    Real dd,dt "auxiliar variables";
    Real eqDiscr,scale;
    Boolean fail=false;
    Integer i=0;
  algorithm
    delta:=rhoMolar*fluidConstants[1].criticalMolarVolume;
    tau:=fluidConstants[1].criticalTemperature/T;
    V:=1/ rhoMolar;
    Arr:=EoS.f_r(delta,tau);
    Z:=1+delta*EoS.f_rd(delta,tau);
    tau0:=tau "initial tau";//referenceConstants.criticalTemperature/T;
    delta0 := delta "initial delta";//rhoMolar * referenceConstants.criticalMolarVolume;
    Arr0 := rf_r(delta0, tau0);
    Z0:=1+delta0*rf_rd(delta0,tau0);
    error:=(Arr-Arr0)^2+(Z-Z0)^2;
    errorOld:=error;
 while error > 1.0e-11 and i < 50 loop
      dd := rf_rd(delta0, tau0);
      dt := rf_rt(delta0, tau0);
      Z0t := delta0 * rf_rtd(delta0, tau0);
      Z0d := dd + delta0 * rf_rdd(delta0, tau0);
      eqDiscr := dt * Z0d - dd * Z0t;
      tau0Prev := tau0;
      delta0Prev := delta0;
      tau0Delta := ((Arr - Arr0) * Z0d - dd * (Z - Z0)) / eqDiscr;
      delta0Delta := (dt * (Z - Z0) - (Arr - Arr0) * Z0t) / eqDiscr;
      for scale in 0.6:(-scale / 2):0.01 loop//should begin at 1.0 but 0.6 is in order to improve convergence
        tau0 := tau0Prev + scale * tau0Delta;
        delta0 := delta0Prev + scale * delta0Delta;
        Z0 := 1 + delta0 * rf_rd(delta0, tau0);
        Arr0 := rf_r(delta0, tau0);
        //assert(false,"Z0: "+String(Z0)+" Arr0:"+String(Arr0)+" Z:"+String(Z)+" Arr:"+String(Arr),AssertionLevel.warning);
        error := (Arr - Arr0) ^ 2 + (Z - Z0) ^ 2;
        if error < errorOld then
          break;
        end if;
      end for;
      i := i + 1;
      if error >= errorOld then
        fail := true;
        break;
      else
        errorOld := error;
      end if;
    end while;
    if fail == true or error > 1.0e-9 then
      T0 := 0;
      DM0 := 0;
    else
      T0 := referenceConstants.criticalTemperature / tau0;
      DM0 := delta0 / referenceConstants.criticalMolarVolume;
    end if;
  end conformalStateSolver;


  function referenceResidualViscosity
    input Real T;
    input Real DM;
    output Real eta;
  protected
    Real eta0,etai,etar;
    Integer diluteModel=referenceViscosityCoeff.diluteModel;
    Integer initialModel=referenceViscosityCoeff.initialModel;
    Integer residualModel=referenceViscosityCoeff.residualModel;
    Real tau=0 "reduced temperature";
    Real delta=0 "reduced density";
    Real epsilon=referenceViscosityCoeff.epsilon;
    Real sigma=referenceViscosityCoeff.sigma "nm";
    Real[size(referenceViscosityCoeff.a, 1),2] a=referenceViscosityCoeff.a;
    Real omega "collision integral";
    Real[size(referenceViscosityCoeff.b, 1),3] b=referenceViscosityCoeff.b;
    Real Bi "m3/mol";
    Real A,B,C,D;
    Real[size(referenceViscosityCoeff.dp, 1),5] dp=referenceViscosityCoeff.dp;
    Real[size(referenceViscosityCoeff.bl, 1),3] bl=referenceViscosityCoeff.bl;
    Real[size(referenceViscosityCoeff.b0n, 1),2] b0n=referenceViscosityCoeff.b0n;
    Real[size(referenceViscosityCoeff.b0d, 1),2] b0d=referenceViscosityCoeff.b0d;
  algorithm
    if diluteModel==2 then
    //collision integral
      tau:=log(T/epsilon);
      omega:=exp(sum(a[i, 1]*(tau)^a[i, 2] for i in 1:size(a, 1)));
      eta0:=referenceViscosityCoeff.diluteLead*(1000*referenceConstants.molarMass*T)^0.5/(sigma^2*omega);
    else
      eta0:=0;
    end if; 
    if initialModel==2 then
    //Rainwater-Friend
      tau:=T/epsilon;
      Bi:= 6.022137e-4*sigma^3*sum(b[i, 1]*tau^b[i, 2] for i in 1:size(b, 1)) "m3/mol";
      etai:=eta0*Bi*DM;
    else
      etai:=0;
    end if;
    if residualModel==2 then
    //modified Batschinski-Hildebrand
      tau:=referenceViscosityCoeff.residualTred/T;
      delta:=DM/referenceViscosityCoeff.residualDMred;
      A:=sum(dp[i, 1]*delta^dp[i, 2]*tau^dp[i,3]*exp(dp[i,4]*delta^dp[i,5]) for i in 1:size(dp, 1)) "double polynomial part";
      B:=sum(bl[i, 1]*delta^bl[i, 2]*tau^bl[i,3] for i in 1:size(bl, 1)) "Batschinski lead";
      C:=sum(b0n[i, 1]*tau^b0n[i,2] for i in 1:size(b0n, 1)) "delta0 num";
      D:=sum(b0d[i, 1]*tau^b0d[i,2] for i in 1:size(b0d, 1)) "delta0 denom";
      etar:=A+B*(1/(C/D-delta)-D/C) "A+B*(1/(delta0-delta)-1/delta0)";
    else
      etar:=0;
    end if;
    eta:=etai+etar;
    //assert(false,"Reference viscosity: "+String(eta0)+"  "+String(etai)+"  "+String(etar),AssertionLevel.warning);
  end referenceResidualViscosity;

  function referenceResidualConductivity
    input Real T;
    input Real DM;
    output Real lambdar;
  protected
    Real MM = referenceConstants.molarMass;
    Integer residualModel=referenceConductivityCoeff.residualModel;
    Real tau=0 "reduced temperature";
    Real delta=0 "reduced density";
    Real[size(referenceConductivityCoeff.b, 1),5] b=referenceConductivityCoeff.b;
    Real Tc=referenceConstants.criticalTemperature;
    Real DMc=1/referenceConstants.criticalMolarVolume;
  algorithm
    //residual calculation
    if residualModel==2 then
    //polynomial
      tau:=referenceConductivityCoeff.residualTred/T;
      delta:=DM*MM/referenceConductivityCoeff.residualDred;
      lambdar:=sum(b[i, 1]*(tau)^b[i, 2]*(delta)^b[i,3] for i in 1:size(b, 1));
    elseif residualModel==3 then
    //polynomial and exponential
      tau:=Tc/T;
      delta:=DM/DMc;
      lambdar:=sum(b[i, 1]*(tau)^b[i, 2]*(delta)^b[i,3]*exp(-b[i,4]*delta^b[i,5]) for i in 1:size(b, 1));
    elseif residualModel==4 then
      //polynomial2
      tau:=T/referenceConductivityCoeff.residualTred;
      delta:=DM*MM/referenceConductivityCoeff.residualDred;
      lambdar:=sum((b[i, 1]+b[i, 2]*tau)*delta^i for i in 1:size(b, 1))*1e-3;
    else
      lambdar:=0;
    end if;
  
  end referenceResidualConductivity;

  function rf_r "residual part of dimensionless Helmholtz energy"

    input Real delta(min=0);
    input Real tau(min=0);
    output Real f_residual "residual part of dimensionless Helmholtz energy";

  protected
    constant Integer nPoly = size(referenceHelmholtzCoeff.residualPoly,1);
    constant Integer nBwr = size(referenceHelmholtzCoeff.residualBwr,1);
    constant Integer nGauss = size(referenceHelmholtzCoeff.residualGauss,1);
    constant Integer nNonAna = size(referenceHelmholtzCoeff.residualNonAnalytical,1);

    constant Real[nPoly,3] p = referenceHelmholtzCoeff.residualPoly;
    constant Real[nBwr,4] b = referenceHelmholtzCoeff.residualBwr;
    constant Real[nGauss,9] g = referenceHelmholtzCoeff.residualGauss;
    constant Real[nNonAna,12] a = referenceHelmholtzCoeff.residualNonAnalytical;

    Real[nNonAna] Psi = {exp(-a[i,9]*(delta-1)^2 -a[i,10]*(tau-1)^2) for i in 1:nNonAna} "Psi";
    Real[nNonAna] Theta = {(1-tau) + a[i,8]*((delta-1)^2)^(0.5/a[i,7]) for i in 1:nNonAna} "Theta";
    Real[nNonAna] Dis = {Theta[i]^2 +a[i,11]*((delta-1)^2)^a[i,12] for i in 1:nNonAna} "Distance function";
    Real[nNonAna] Disb = {Dis[i]^a[i,6] for i in 1:nNonAna} "Distance function to the power of b";

  algorithm
    f_residual :=
      sum(p[i,1]*tau^p[i,2]*delta^p[i,3] for i in 1:nPoly)
    + sum(b[i,1]*tau^b[i,2]*delta^b[i,3]*exp(-delta^b[i,4]) for i in 1:nBwr)
    + sum(g[i,1]*tau^g[i,2]*delta^g[i,3]*exp(g[i,6]*(delta - g[i,9])^g[i,4] + g[i,7]*(tau - g[i,8])^g[i,5]) for i in 1:nGauss)
    + sum(a[i,1]*Disb[i]*delta*Psi[i] for i in 1:nNonAna);
  end rf_r;
  
  function rf_rd "residual part of dimensionless Helmholtz energy"

    input Real delta;
    input Real tau;
    output Real f_residual_delta
    "residual part of dimensionless Helmholtz energy";

  protected
    constant Integer nPoly = size(referenceHelmholtzCoeff.residualPoly,1);
    constant Integer nBwr = size(referenceHelmholtzCoeff.residualBwr,1);
    constant Integer nGauss = size(referenceHelmholtzCoeff.residualGauss,1);
    constant Integer nNonAna = size(referenceHelmholtzCoeff.residualNonAnalytical,1);

    constant Real[nPoly,3] p = referenceHelmholtzCoeff.residualPoly;
    constant Real[nBwr,4] b = referenceHelmholtzCoeff.residualBwr;
    constant Real[nGauss,9] g = referenceHelmholtzCoeff.residualGauss;
    constant Real[nNonAna,12] a = referenceHelmholtzCoeff.residualNonAnalytical;

    Real[nNonAna] Psi = {exp(-a[i,9]*(delta-1)^2 -a[i,10]*(tau-1)^2) for i in 1:nNonAna} "Psi";
    Real[nNonAna] Theta = {(1-tau) + a[i,8]*((delta-1)^2)^(0.5/a[i,7]) for i in 1:nNonAna} "Theta";
    Real[nNonAna] Dis = {Theta[i]^2 +a[i,11]*((delta-1)^2)^a[i,12] for i in 1:nNonAna} "Distance function";
    Real[nNonAna] Disb = {Dis[i]^a[i,6] for i in 1:nNonAna} "Distance function to the power of b";

    Real[nNonAna] Psi_d = {-a[i,9]*(2*delta-2)*Psi[i] for i in 1:nNonAna};
    Real[nNonAna] Theta_d = {if (delta-1)<>0 then (a[i,8]*(2*delta-2)*((delta-1)^2)^(0.5/a[i,7])) / (2*a[i,7]*(delta-1)^2) else 0 for i in 1:nNonAna};
    Real[nNonAna] Dis_d = {if (delta-1)<>0 then (2*a[i,11]*a[i,12]*((delta-1)^2)^a[i,12]) / (delta-1) +2*Theta[i]*Theta_d[i] else 0 for i in 1:nNonAna};
    Real[nNonAna] Disb_d = {if Dis[i]<>0 then a[i,6]*Dis[i]^(a[i,6]-1)*Dis_d[i] else 0 for i in 1:nNonAna};

  algorithm
    f_residual_delta :=
      sum(p[i,1]*p[i,3]*delta^(p[i,3] - 1)*tau^p[i,2] for i in 1:nPoly)
    + sum(b[i,1]*exp(-delta^b[i,4])*(delta^(b[i,3] - 1)*tau^b[i,2]*(b[i,3] - b[i,4]*delta^b[i,4])) for i in 1:nBwr)
    + sum(g[i,1]*delta^g[i,3]*tau^g[i,2]*exp(g[i,6]*(delta - g[i,9])^2 + g[i,7]*(tau - g[i,8])^2)*(g[i,3]/delta + 2*g[i,6]*(delta - g[i,9])) for i in 1:nGauss)
    + sum(a[i,1]*(delta*Disb[i]*Psi_d[i] + delta*Psi[i]*Disb_d[i] + Disb[i]*Psi[i]) for i in 1:nNonAna);

  end rf_rd;
  
  function rf_rdd "residual part of dimensionless Helmholtz energy"

  input Real delta;
  input Real tau;
  output Real f_residual_delta_delta
    "residual part of dimensionless Helmholtz energy";

protected
  constant Integer nPoly = size(referenceHelmholtzCoeff.residualPoly,1);
  constant Integer nBwr = size(referenceHelmholtzCoeff.residualBwr,1);
  constant Integer nGauss = size(referenceHelmholtzCoeff.residualGauss,1);
  constant Integer nNonAna = size(referenceHelmholtzCoeff.residualNonAnalytical,1);

  constant Real[nPoly,3] p = referenceHelmholtzCoeff.residualPoly;
  constant Real[nBwr,4] b = referenceHelmholtzCoeff.residualBwr;
  constant Real[nGauss,9] g = referenceHelmholtzCoeff.residualGauss;
  constant Real[nNonAna,12] a = referenceHelmholtzCoeff.residualNonAnalytical;

  Real[nNonAna] Psi = {exp(-a[i,9]*(delta-1)^2 -a[i,10]*(tau-1)^2) for i in 1:nNonAna} "Psi";
  Real[nNonAna] Theta = {(1-tau) + a[i,8]*((delta-1)^2)^(0.5/a[i,7]) for i in 1:nNonAna} "Theta";
  Real[nNonAna] Dis = {Theta[i]^2 +a[i,11]*((delta-1)^2)^a[i,12] for i in 1:nNonAna} "Distance function";
  Real[nNonAna] Disb = {Dis[i]^a[i,6] for i in 1:nNonAna} "Distance function to the power of b";

  Real[nNonAna] Psi_d = {-a[i,9]*(2*delta-2)*Psi[i] for i in 1:nNonAna};
  Real[nNonAna] Theta_d = {if (delta-1)<>0 then (a[i,8]*(2*delta-2)*((delta-1)^2)^(0.5/a[i,7])) / (2*a[i,7]*(delta-1)^2) else 0 for i in 1:nNonAna};
  Real[nNonAna] Dis_d = {if (delta-1)<>0 then (2*a[i,11]*a[i,12]*((delta-1)^2)^a[i,12]) / (delta-1) +2*Theta[i]*Theta_d[i] else 0 for i in 1:nNonAna};
  Real[nNonAna] Disb_d = {if Dis[i]<>0 then a[i,6]*Dis[i]^(a[i,6]-1)*Dis_d[i] else 0 for i in 1:nNonAna};

  Real[nNonAna] Psi_dd = {2*a[i,9]*(2*a[i,9]*(delta-1)^2-1)*Psi[i] for i in 1:nNonAna};
  Real[nNonAna] Theta_dd = {if (delta-1)<>0 then (a[i,8]*(1/a[i,7]-1)*((delta-1)^2)^(0.5/a[i,7])) / (a[i,7]*(delta-1)^2) else 0 for i in 1:nNonAna};
  Real[nNonAna] Dis_dd = {if (delta-1)<>0 then 2*Theta[i]*Theta_dd[i] + 2*Theta_d[i]^2 + (2*((delta-1)^2)^a[i,12]) / (delta-1)^2 *(2*a[i,11]*a[i,12]^2-a[i,11]*a[i,12]) else 0 for i in 1:nNonAna};
  Real[nNonAna] Disb_dd = {if (delta-1)<>0 then a[i,6]*(a[i,6]*Dis_d[i]^2 + Dis[i]*Dis_dd[i] - Dis_d[i]^2)*Dis[i]^(a[i,6]-2) else 0 for i in 1:nNonAna};

algorithm
  f_residual_delta_delta :=
      sum(p[i,1]*p[i,3]*(p[i,3] - 1)*delta^(p[i,3] - 2)*tau^p[i,2] for i in 1:nPoly)
    + sum(b[i,1]*exp(-delta^b[i,4])*(delta^(b[i,3] - 2)*tau^b[i,2]*((b[i,3] - b[i,4]*delta^b[i,4])*(b[i,3] - 1 - b[i,4]*delta^b[i,4]) - b[i,4]^2*delta^b[i,4])) for i in 1:nBwr)
    + sum(g[i,1]*tau^g[i,2]*exp(g[i,6]*(delta - g[i,9])^2 + g[i,7]*(tau - g[i,8])^2)*(  2*g[i,6]*delta^g[i,3] + 4*g[i,6]^2*delta^g[i,3]*(delta - g[i,9])^2 + 4*g[i,3]*g[i,6]*delta^(g[i,3] - 1)*(delta - g[i,9]) +   g[i,3]*(g[i,3] - 1)*delta^(g[i,3] - 2)) for i in 1:nGauss)
    + sum(a[i,1]*(delta*Disb[i]*Psi_dd[i] + delta*Psi[i]*Disb_dd[i] + 2*delta*Disb_d[i]*Psi_d[i] + 2*Disb[i]*Psi_d[i] + 2*Psi[i]*Disb_d[i]) for i in 1:nNonAna);

end rf_rdd;

  function rf_rt "residual part of dimensionless Helmholtz energy for reference substance"

  input Real delta;
  input Real tau;
  output Real f_residual_tau "residual part of dimensionless Helmholtz energy";

protected
  constant Integer nPoly = size(referenceHelmholtzCoeff.residualPoly,1);
  constant Integer nBwr = size(referenceHelmholtzCoeff.residualBwr,1);
  constant Integer nGauss = size(referenceHelmholtzCoeff.residualGauss,1);
  constant Integer nNonAna = size(referenceHelmholtzCoeff.residualNonAnalytical,1);

  constant Real[nPoly,3] p = referenceHelmholtzCoeff.residualPoly;
  constant Real[nBwr,4] b = referenceHelmholtzCoeff.residualBwr;
  constant Real[nGauss,9] g = referenceHelmholtzCoeff.residualGauss;
  constant Real[nNonAna,12] a = referenceHelmholtzCoeff.residualNonAnalytical;

  Real[nNonAna] Psi = {exp(-a[i,9]*(delta-1)^2 -a[i,10]*(tau-1)^2) for i in 1:nNonAna} "Psi";
  Real[nNonAna] Theta = {(1-tau) + a[i,8]*((delta-1)^2)^(0.5/a[i,7]) for i in 1:nNonAna} "Theta";
  Real[nNonAna] Dis = {Theta[i]^2 +a[i,11]*((delta-1)^2)^a[i,12] for i in 1:nNonAna} "Distance function";
  Real[nNonAna] Disb = {Dis[i]^a[i,6] for i in 1:nNonAna} "Distance function to the power of b";

  Real[nNonAna] Psi_t = {-a[i,10]*(2*tau-2)*Psi[i] for i in 1:nNonAna};
  Real[nNonAna] Theta_t = {-1 for i in 1:nNonAna};
  Real[nNonAna] Dis_t = {2*Theta[i]*Theta_t[i] for i in 1:nNonAna};
  Real[nNonAna] Disb_t = {if Dis[i]<>0 then a[i,6]*Dis[i]^(a[i,6]-1)*Dis_t[i] else 0 for i in 1:nNonAna};

algorithm
  f_residual_tau :=
      sum(p[i,1]*p[i,2]*tau^(p[i,2] - 1)*delta^p[i,3] for i in 1:nPoly)
    + sum(b[i,1]*b[i,2]*tau^(b[i,2] - 1)*delta^b[i,3]*exp(-delta^b[i,4]) for i in 1:nBwr)
    + sum(g[i,1]*tau^g[i,2]*delta^g[i,3]*exp(g[i,6]*(delta - g[i,9])^2 + g[i,7]*(tau - g[i,8])^2)*(g[i,2]/tau + 2*g[i,7]*(tau - g[i,8])) for i in 1:nGauss)
    + sum(a[i,1]*delta*(Disb[i]*Psi_t[i] + Psi[i]*Disb_t[i]) for i in 1:nNonAna);

end rf_rt;

  function rf_rtd "residual part of dimensionless Helmholtz energy"

  input Real delta;
  input Real tau;
  output Real f_residual_delta_tau
    "residual part of dimensionless Helmholtz energy";

protected
  constant Integer nPoly = size(referenceHelmholtzCoeff.residualPoly,1);
  constant Integer nBwr = size(referenceHelmholtzCoeff.residualBwr,1);
  constant Integer nGauss = size(referenceHelmholtzCoeff.residualGauss,1);
  constant Integer nNonAna = size(referenceHelmholtzCoeff.residualNonAnalytical,1);

  constant Real[nPoly,3] p = referenceHelmholtzCoeff.residualPoly;
  constant Real[nBwr,4] b = referenceHelmholtzCoeff.residualBwr;
  constant Real[nGauss,9] g = referenceHelmholtzCoeff.residualGauss;
  constant Real[nNonAna,12] a = referenceHelmholtzCoeff.residualNonAnalytical;

  Real[nNonAna] Psi = {exp(-a[i,9]*(delta-1)^2 -a[i,10]*(tau-1)^2) for i in 1:nNonAna} "Psi";
  Real[nNonAna] Theta = {(1-tau) + a[i,8]*((delta-1)^2)^(0.5/a[i,7]) for i in 1:nNonAna} "Theta";
  Real[nNonAna] Dis = {Theta[i]^2 +a[i,11]*((delta-1)^2)^a[i,12] for i in 1:nNonAna} "Distance function";
  Real[nNonAna] Disb = {Dis[i]^a[i,6] for i in 1:nNonAna} "Distance function to the power of b";

  Real[nNonAna] Psi_t = {-a[i,10]*(2*tau-2)*Psi[i] for i in 1:nNonAna};
  Real[nNonAna] Theta_t = {-1 for i in 1:nNonAna};
  Real[nNonAna] Dis_t = {2*Theta[i]*Theta_t[i] for i in 1:nNonAna};
  Real[nNonAna] Disb_t = {if Dis[i]<>0 then a[i,6]*Dis[i]^(a[i,6]-1)*Dis_t[i] else 0 for i in 1:nNonAna};

  Real[nNonAna] Psi_d = {-a[i,9]*(2*delta-2)*Psi[i] for i in 1:nNonAna};
  Real[nNonAna] Theta_d = {if (delta-1)<>0 then (a[i,8]*(2*delta-2)*((delta-1)^2)^(0.5/a[i,7])) / (2*a[i,7]*(delta-1)^2) else 0 for i in 1:nNonAna};
  Real[nNonAna] Dis_d = {if (delta-1)<>0 then (2*a[i,11]*a[i,12]*((delta-1)^2)^a[i,12]) / (delta-1) +2*Theta[i]*Theta_d[i] else 0 for i in 1:nNonAna};
  Real[nNonAna] Disb_d = {if Dis[i]<>0 then a[i,6]*Dis[i]^(a[i,6]-1)*Dis_d[i] else 0 for i in 1:nNonAna};

  Real[nNonAna] Psi_td = {a[i,9]*a[i,10]*(2*delta-2)*(2*tau-2)*Psi[i] for i in 1:nNonAna};
  //Real[nNonAna] Theta_td = {0 for i in 1:nNonAna};
  Real[nNonAna] Dis_td = {2*Theta_d[i]*Theta_t[i] for i in 1:nNonAna};
  Real[nNonAna] Disb_td = {if Dis[i]<>0 then a[i,6]/Dis[i]^3* ((a[i,6]-1)*Dis[i]^(a[i,6]+1)*Dis_d[i]*Dis_t[i] + Dis[i]^(a[i,6]+2)*Dis_td[i]) else 0 for i in 1:nNonAna};

algorithm
  f_residual_delta_tau :=
      sum(p[i,1]*p[i,3]*p[i,2]*delta^(p[i,3] - 1)*tau^(p[i,2] - 1) for i in 1:nPoly)
    + sum(b[i,1]*b[i,2]*delta^(b[i,3] - 1)*tau^(b[i,2] - 1)*(b[i,3] - b[i,4]*delta^b[i,4])*exp(-delta^b[i,4]) for i in 1:nBwr)
    + sum(g[i,1]*delta^g[i,3]*tau^g[i,2]*exp(g[i,6]*(delta - g[i,9])^2 + g[i,7]*(tau - g[i,8])^2)*(g[i,3]/delta + 2*g[i,6]*(delta - g[i,9]))*(g[i,2]/tau + 2*g[i,7]*(tau - g[i,8])) for i in 1:nGauss)
    + sum(a[i,1]*(delta*Disb[i]*Psi_td[i] + delta*Psi[i]*Disb_td[i] + delta*Disb_d[i]*Psi_t[i] + delta*Disb_t[i]*Psi_d[i] + Disb[i]*Psi_t[i] + Psi[i]*Disb_t[i]) for i in 1:nNonAna);

end rf_rtd;


end Transport;

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
  
    constant Integer residualModel=0 "0=no model, 1=hardcoded, 2=mod.Batschinski_Hildebrand, 3=friction theory, 6=Chung, 10=from p and T correlation";
    constant Temperature residualTred=0 "residual reducing temperature";
    constant Real residualDMred=0 "residual reducing molar density";
    constant Real[:,5] dp =  fill(0.0, 0, 5) "coefficients for double polynomial part";
    constant Real[:,3] bl =  fill(0.0, 0, 3) "Batschinski part lead, or friction theory coefficients";
    constant Real[:,2] b0n =  fill(0.0, 0, 2) "Batschinski part delta0 num";
    constant Real[:,2] b0d =  fill(0.0, 0, 2) "Batschinski part delta0 denom";
    constant Real c1=1, c2=1 "coefficients for psi calculation in friction theory";
    constant Integer corrL=0 "correlation for liquid viscosity";
    constant Real[:] coefL = fill(0.0,0) "coefficients for liquid viscosity";
 end DynamicViscosityCoefficients;
	
  record ThermalConductivityCoefficients
    constant Integer diluteModel=0 "0=no model, 1=hardcoded, 2=rational polynomia, 3=eta0 and polynomia, 10=from T correlation";
    constant Temperature diluteTred=0 "dilute reducing temperature";
    constant Real[:,2] an = fill(0.0, 0, 2) "dilute coefficients num";
    constant Real[:,2] ad = fill(0.0, 0, 2) "dilute coefficients denom";
    constant Integer corrG=0 "correlation for gas low density thermal conductivity";
    constant Real[:] coefG = fill(0.0,0) "coefficients for gas low density thermal conductivity";
   
    constant Integer residualModel=0 "0=no model, 1=hardcoded, 2=polynomial, 3=polynomial and exponential, 4=polynomial2, 10=from p and T correlation";
    constant Temperature residualTred=0 "residual reducing temperature";
    constant Real residualDMred=0 "residual reducing molar density";
    constant Real residualDred=0 "residual reducing mass density";
    constant Real[:,5] b =  fill(0.0, 0, 5) "coefficients for residual part";
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
 
end Transport;

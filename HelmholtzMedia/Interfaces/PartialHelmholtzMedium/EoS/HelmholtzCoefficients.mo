within HelmholtzMedia.Interfaces.PartialHelmholtzMedium.EoS;
record HelmholtzCoefficients
  "Coefficients for Helmholtz energy equations of state"

  //ideal gas part: substance specific coefficients
  constant Real[:,2] idealLog = fill(0.0, 0, 2);
  constant Real[:,2] idealPower = fill(0.0, 0, 2);
  constant Real[:,2] idealEinstein = fill(0.0, 0, 2);
  constant Real[:,2] idealCosh = fill(0.0, 0, 2);
  constant Real[:,2] idealSinh = fill(0.0, 0, 2);
  //added by CTG
  constant Real[:,4] idealEinsteinGeneralized = fill(0.0, 0, 4);
  constant Real[2] idealLead=fill(0.0,2);
  constant Real[2] idealASHRAEoffset=fill(0.0,2);
  constant Real[2] idealIIRoffset=fill(0.0,2);
  constant Real[2] idealNBPoffset=fill(0.0,2);
  constant Real Tc = 0;
  constant Real T0 = 0;
  constant Real idealCpConst = 0;
  constant Real[:,2] idealCpPolyT = fill(0.0, 0, 2);
  constant Real[2] lead=if refState==ReferenceState.ASHRAE then idealLead+idealASHRAEoffset elseif refState==ReferenceState.IIR then idealLead+idealIIRoffset elseif refState==ReferenceState.NBP then idealLead+idealNBPoffset else idealLead;
  
  //residual part: substance specific coefficients
  constant Real[:,3] residualPoly = fill(0.0, 0, 3);
  constant Real[:,4] residualBwr = fill(0.0, 0, 4);
  constant Real[:,9] residualGauss = fill(0.0, 0, 9);
  constant Real[:,12] residualNonAnalytical = fill(0.0, 0, 12);

  Boolean useLineSearch=false;
end HelmholtzCoefficients;

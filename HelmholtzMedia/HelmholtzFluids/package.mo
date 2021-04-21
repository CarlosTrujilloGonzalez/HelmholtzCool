within HelmholtzMedia;
package HelmholtzFluids
  model ReferenceStateFinder
  "Finds the coefficients needed to reference enthalpy and entropy to the selected reference state.
  In the fluid file it is necessary to add a new line in the constant HelmholtzCoefficients, in the form: idealIIRoffset={IIR_a1, IIR_a2}, where IIR_a1 or a2 are the numerical values found.
  You change to idealNBPoffset or idealASHRAEoffset as needed. The pressure added to the vapor pressure to grant liquid state can be normally lower, or a bubble state used"
    replaceable package Medium = Helium(refState=Medium.ReferenceState.None);
    /*Medium.ThermodynamicState StateASHRAE;
    Real ASHRAEh, ASHRAEs, ASHRAE_a1, ASHRAE_a2;
    Medium.ThermodynamicState StateIIR;
    Real IIRh, IIRs, IIR_a1, IIR_a2;*/
    Medium.ThermodynamicState StateNBP;
    Real NBPh, NBPs, NBP_a1, NBP_a2;
  
  equation
    /*StateASHRAE=Medium.setState_pTX(Medium.saturationPressure(273.15-40)+50,273.15-40);
    ASHRAEh=Medium.specificEnthalpy(StateASHRAE);
    ASHRAEs=Medium.specificEntropy(StateASHRAE);
    ASHRAE_a1=(ASHRAEs)*Medium.fluidConstants[1].molarMass/8.314472;
    ASHRAE_a2=(-ASHRAEh)*Medium.fluidConstants[1].molarMass/(8.314472*Medium.fluidConstants[1].criticalTemperature);
    StateIIR=Medium.setState_pTX(Medium.saturationPressure(273.15)+50,273.15);
    IIRh=Medium.specificEnthalpy(StateIIR);
    IIRs=Medium.specificEntropy(StateIIR);
    IIR_a1=(IIRs-1e3)*Medium.fluidConstants[1].molarMass/8.314472;
    IIR_a2=(2e5-IIRh)*Medium.fluidConstants[1].molarMass/(8.314472*Medium.fluidConstants[1].criticalTemperature);*/
    StateNBP=Medium.setState_pTX(101325+25,Medium.saturationTemperature(101325));
    NBPh=Medium.specificEnthalpy(StateNBP);
    NBPs=Medium.specificEntropy(StateNBP);
    NBP_a1=(NBPs)*Medium.fluidConstants[1].molarMass/8.314472;
    NBP_a2=(-NBPh)*Medium.fluidConstants[1].molarMass/(8.314472*Medium.fluidConstants[1].criticalTemperature);
  end ReferenceStateFinder;
end HelmholtzFluids;

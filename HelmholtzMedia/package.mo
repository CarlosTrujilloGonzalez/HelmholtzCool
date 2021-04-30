within ;
package HelmholtzMedia "Data and models of real pure fluids (liquid, two-phase and gas)"
  extends Modelica.Icons.MaterialPropertiesPackage;
   model ReferenceStateFinder
  "Finds the coefficients needed to reference enthalpy and entropy to the selected reference state.
  In the fluid file it is necessary to add a new line in the constant HelmholtzCoefficients, in the form: idealIIRoffset={IIR_a1, IIR_a2}, where IIR_a1 or a2 are the numerical values found.
  You change to idealNBPoffset or idealASHRAEoffset as needed. The pressure added to the vapor pressure to grant liquid state can be normally lower, or a bubble state used"
    replaceable package Medium = HelmholtzFluidsR.R124(refState=Medium.ReferenceState.None);
    /*Medium.ThermodynamicState StateASHRAE;
    Real ASHRAEh, ASHRAEs, ASHRAE_a1, ASHRAE_a2;*/
    Medium.ThermodynamicState StateIIR;
    Real IIRh, IIRs, IIR_a1, IIR_a2;
    Medium.ThermodynamicState StateNBP;
    Real NBPh, NBPs, NBP_a1, NBP_a2;
  
  equation
    /*StateASHRAE=Medium.setState_pTX(Medium.saturationPressure(273.15-40)+50,273.15-40);
    ASHRAEh=Medium.specificEnthalpy(StateASHRAE);
    ASHRAEs=Medium.specificEntropy(StateASHRAE);
    ASHRAE_a1=(ASHRAEs)*Medium.fluidConstants[1].molarMass/8.314472;
    ASHRAE_a2=(-ASHRAEh)*Medium.fluidConstants[1].molarMass/(8.314472*Medium.fluidConstants[1].criticalTemperature);*/
    StateIIR=Medium.setState_pTX(Medium.saturationPressure(273.15)+50,273.15);
    IIRh=Medium.specificEnthalpy(StateIIR);
    IIRs=Medium.specificEntropy(StateIIR);
    IIR_a1=(IIRs-1e3)*Medium.fluidConstants[1].molarMass/8.314472;
    IIR_a2=(2e5-IIRh)*Medium.fluidConstants[1].molarMass/(8.314472*Medium.fluidConstants[1].criticalTemperature);
    StateNBP=Medium.setState_pTX(101325+25,Medium.saturationTemperature(101325));
    NBPh=Medium.specificEnthalpy(StateNBP);
    NBPs=Medium.specificEntropy(StateNBP);
    NBP_a1=(NBPs)*Medium.fluidConstants[1].molarMass/8.314472;
    NBP_a2=(-NBPh)*Medium.fluidConstants[1].molarMass/(8.314472*Medium.fluidConstants[1].criticalTemperature);
  end ReferenceStateFinder;

  model LimitsAndCriticalState
    replaceable package Medium = HelmholtzMedia.HelmholtzFluidsR.R32;
    Medium.ThermodynamicState StateCritical, StateMaxMax, StateMaxMin, StateMinMax, StateMinMin, StateTriple;
    Real CriticalH, CriticalS;
    Real Hmax, Hmin, Smax, Smin;
  protected
    Real Dmax, Dmin, Tmax, Tmin, Pmax, Ptriple;
  equation
    Dmax = Medium.fluidLimits.DMAX;
    Dmin = Medium.fluidLimits.DMIN;
    Tmin = Medium.fluidLimits.TMIN;
    Tmax = Medium.fluidLimits.TMAX;
    Pmax = Medium.fluidLimits.PMAX;
    Ptriple = Medium.fluidConstants[1].triplePointPressure;
    StateCritical = Medium.setState_dTX(Medium.fluidConstants[1].molarMass / Medium.fluidConstants[1].criticalMolarVolume, Medium.fluidConstants[1].criticalTemperature);
    CriticalH = Medium.specificEnthalpy(StateCritical);
    CriticalS = Medium.specificEntropy(StateCritical);
    StateMaxMax = Medium.setState_pTX(Pmax, Tmax);
    StateMaxMin = Medium.setState_dTX(Dmax, Tmin);
    StateMinMax = Medium.setState_dTX(Dmin, Tmax);
    StateMinMin = Medium.setState_dTX(Dmin, Tmin);
    StateTriple = Medium.setState_pTX(Ptriple+100, Tmin);
    Hmax = max([StateMaxMax.h, StateMaxMin.h, StateMinMax.h, StateMinMin.h]);
    Hmin = min([StateMaxMax.h, StateMaxMin.h, StateMinMax.h, StateMinMin.h, StateTriple.h]);
    Smax = max([StateMaxMax.s, StateMaxMin.s, StateMinMax.s, StateMinMin.s]);
    Smin = min([StateMaxMax.s, StateMaxMin.s, StateMinMax.s, StateMinMin.s, StateTriple.s]);
end LimitsAndCriticalState;

  annotation (uses(Modelica(version="3.2.3")));
end HelmholtzMedia;

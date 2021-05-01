within HelmholtzMedia.HelmholtzFluidsAB;
package Acetone "Acetone"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="acetone" "short name",
  final fluidConstants={fluidConstantsAcetone},
  final helmholtzCoefficients=helmholtzCoefficientsAcetone,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsAcetone,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsAcetone,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsAcetone,
  final ancillaryCoefficients=ancillaryCoefficientsAcetone,
  final fluidLimits=fluidLimitsAcetone,
  final refSubstance=ReferenceSubstance.Propane,
  final referenceHelmholtzCoeff = Transport.ECSreferences.helmholtzCoefficientsPropane,
  final referenceConstants =  Transport.ECSreferences.fluidConstantsPropane,
  final referenceViscosityCoeff = Transport.ECSreferences.dynamicViscosityCoefficientsPropane,
  final referenceConductivityCoeff = Transport.ECSreferences.thermalConductivityCoefficientsPropane,
  Density(min=fluidLimitsAcetone.DMIN, max=fluidLimitsAcetone.DMAX, start=fluidConstantsAcetone.molarMass/fluidConstantsAcetone.criticalMolarVolume),
  Temperature(min=fluidLimitsAcetone.TMIN, max=fluidLimitsAcetone.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsAcetone.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsAcetone.HMIN, max=fluidLimitsAcetone.HMAX, start=(fluidLimitsAcetone.HMIN+fluidLimitsAcetone.HMAX)/2),
  SpecificEntropy(min=fluidLimitsAcetone.SMIN, max=fluidLimitsAcetone.SMAX, start=(fluidLimitsAcetone.SMIN+fluidLimitsAcetone.SMAX)/2));

  final constant FluidConstants
  fluidConstantsAcetone(
    casRegistryNumber="67-64-1",
    molarMass=0.05807914,
    hasCriticalData=true,
       criticalTemperature=508.1,
       criticalPressure=4700000.0,
       criticalMolarVolume=0.00021276595744680856,
       //HCRIT0=544338.81959121,//CoolProp
       HCRIT0=865153,//EOS calculation
       //SCRIT0=1256.4085795064427,//CoolProp
       SCRIT0=2657.9,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=2.88,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=false,
    hasAccurateConductivityData=false,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.3071,
    triplePointTemperature=178.5,
    triplePointPressure=2.326486886400373,
    normalBoilingPoint=329.15,
    meltingPoint=178.5) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsAcetone(
    TMIN=fluidConstantsAcetone.triplePointTemperature,
    TMAX=550,
    DMIN=Modelica.Constants.small,
    DMAX=913.58,//RefProp
    //DMAX=1061.66,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=700000000,
    HMIN=0,
    HMAX=1.44035e6,
    SMIN=-385.7,
    SMAX=23623.3) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsAcetone(
    idealLead={-9.4883659997, 7.1422719708},
    idealLog=[
      3,         1.],
    idealEinstein=[
      3.7072,        -0.6101161188742373;
      7.0675,        -6.849045463491438;
      11.012,        -3.101751623696123],
    idealIIRoffset={0, 0},
    idealNBPoffset={9.7898709978717, -4.41053410795899},
    residualPoly=[
      0.90041,    0.25,    1;
      -2.1267,    1.25,    1;
      -0.083409,    1.5,    1;
      0.065683,    0.25,    3;
      0.00016527,    0.875,    7],
    residualBwr=[
      -0.039663,    2.375,    1,    1;
      0.72085,    2,    2,    1;
      0.0092318,    2.125,    5,    1;
      -0.17217,    3.5,    1,    2;
      -0.14961,    6.5,    1,    2;
      -0.076124,    4.75,    4,    2;
      -0.018166,    12.5,    2,    3])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsAcetone(
    ai={0.954299e-3,0.522303e-6},
    corrG=120,
    coefG={-2.6882E+01,9.036E-01,-1.210E+08,-6.0879E+08,0.0},
    diluteModel=9,
    nistCoeff={1.08482,-0.0313081},
    corrL=50,
    coefL={2.189E-01,-5.3067E-05,-4.566E-07,0.0,0.0},
    residualModel=9,
    qD=1706484642,
    zeta0=1.96e-10,
    Gamma=0.052,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsAcetone(
    epsilon=519,
    sigma=0.4669,
    diluteModel=3,
    initialModel=0,
    nistCoeff={1.25183,-0.239533,0.0485815},
    corrL=32,
    coefL={-7.2126E+00,9.030E+02,1.8385E-02,-2.0353E-05,0.0},
    residualModel=9);
  
  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsAcetone(
    Tc=508.1,
    coeffs=[
      0.0633,        1.16]) "Coefficients for the surface tension";
      
  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsAcetone(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -0.0016008456143345507,        0.001;
      3.207344301426565,        0.884;
      -10.073384813177839,        0.945;
      0.43583596844503064,        1.521;
      -3.5513036420695365,        3.503;
      -0.8398623740312517,        6.996],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      7.78253597073335,        0.45;
      -18.960548358570204,        0.684;
      22.83032556167124,        0.944;
      -224.35339428090518,        1.818;
      232.0353784600054,        1.876;
      -16.31650346262528,        2.307],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -2.7083518485413607,        0.375;
      -3.1091181958405696,        0.899;
      -11.940789313674161,        5.115;
      6086.186843505146,        12.812;
      -12978.535578983987,        13.551;
      7630.400461122001,        14.638])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Lemmon-JCED-2006</p>
<p>Viscosity and thermal conductivity: ECS plus correlations</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
</html>"));
end Acetone;

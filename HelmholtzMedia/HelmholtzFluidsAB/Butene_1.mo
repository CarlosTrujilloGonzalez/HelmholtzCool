within HelmholtzMedia.HelmholtzFluidsAB;
package Butene_1 "Butene_1"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="butene_1" "short name",
  final fluidConstants={fluidConstantsButene_1},
  final helmholtzCoefficients=helmholtzCoefficientsButene_1,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsButene_1,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsButene_1,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsButene_1,
  final ancillaryCoefficients=ancillaryCoefficientsButene_1,
  final fluidLimits=fluidLimitsButene_1,
  final referenceHelmholtzCoeff = HelmholtzFluidsPQ.Propane.helmholtzCoefficientsPropane,
  final referenceConstants =  HelmholtzFluidsPQ.Propane.fluidConstantsPropane,
  final referenceViscosityCoeff = HelmholtzFluidsPQ.Propane.dynamicViscosityCoefficientsPropane,
  final referenceConductivityCoeff = HelmholtzFluidsPQ.Propane.thermalConductivityCoefficientsPropane,
  Density(min=fluidLimitsButene_1.DMIN, max=fluidLimitsButene_1.DMAX, start=fluidConstantsButene_1.molarMass/fluidConstantsButene_1.criticalMolarVolume),
  Temperature(min=fluidLimitsButene_1.TMIN, max=fluidLimitsButene_1.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsButene_1.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsButene_1.HMIN, max=fluidLimitsButene_1.HMAX, start=(fluidLimitsButene_1.HMIN+fluidLimitsButene_1.HMAX)/2),
  SpecificEntropy(min=fluidLimitsButene_1.SMIN, max=fluidLimitsButene_1.SMAX, start=(fluidLimitsButene_1.SMIN+fluidLimitsButene_1.SMAX)/2));

  final constant FluidConstants
  fluidConstantsButene_1(
    casRegistryNumber="106-98-9",
    molarMass=0.05610631999999999,
    hasCriticalData=true,
       criticalTemperature=419.29,
       criticalPressure=4005100.0,
       criticalMolarVolume=0.0002358490566037736,
       HCRIT0=465885.74365463975,//CoolProp OK
       SCRIT0=1304.996623396847,//CoolProp OK
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=0.34,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=false,
    hasAccurateConductivityData=false,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.191860647355,
    triplePointTemperature=87.80000000000001,
    triplePointPressure=7.563664543837497e-07,
    normalBoilingPoint=266.92,
    meltingPoint=87.80000000000001) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsButene_1(
    TMIN=fluidConstantsButene_1.triplePointTemperature,
    TMAX=525,
    DMIN=Modelica.Constants.small,
    DMAX=818.59,//RefProp
    //DMAX=832.35,
    PMIN=Modelica.Constants.small,
    PMAX=50000000,
    HMIN=-350481,
    HMAX=888750,
    SMIN=-2167.04,
    SMAX=23246.7) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsButene_1(
    idealLead={-0.00101126, 2.3869174},
    idealLog=[
      2.9197,         1.],
    idealEinstein=[
      2.9406,        -0.6534856543203987;
      6.5395,        -2.268119917002552;
      14.535,        -5.072861265472584;
      5.8971,        -13.71842877244866],
    idealIIRoffset={-6.4051, 2.99726},
    idealNBPoffset={0, 0},
    residualPoly=[
      0.78084,    0.12,    1;
      -2.8258,    1.3,    1;
      0.99403,    1.74,    1;
      0.017951,    2.1,    2;
      0.088889,    0.28,    3;
      0.00024673,    0.69,    7],
    residualBwr=[
      0.22846,    0.75,    2,    1;
      -0.074009,    2,    5,    1;
      -0.22913,    4.4,    1,    2;
      -0.062334,    4.7,    4,    2;
      -0.025385,    15,    3,    3;
      0.01104,    14,    4,    3])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsButene_1(
    ai={0.000900239,1.13436e-6},
    corrG=120,
    coefG={9.2115E-05,1.1181E+00,7.1719E+02,1.3037E+04,0.0},
    diluteModel=9,
    nistCoeff={0.838527,0.0648013},
    corrL=51,
    coefL={7.1267E-02,9.9471E+01,-4.2011,1.4325E-02,-4.1157E-05},
    residualModel=9,
    qD=1647446458,
    zeta0=2.11e-10,
    Gamma=0.057,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsButene_1(
    epsilon=319.0,
    sigma=0.5198,
    corrG=110,
    coefG={7.0347E-07,5.4535E-01,3.088E+02,-2.327E+02,0.0},
    diluteModel=3,
    initialModel=0,
    nistCoeff={1.12449,-0.147034,0.0366550},
    corrL=32,
    coefL={-4.9218,4.9503E+02,1.439E-02,-2.0853E-05,0.0},
    residualModel=9);
  
  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsButene_1(
    Tc=419.29,
    coeffs=[
      0.05644,        1.248]) "Coefficients for the surface tension"; 
  
  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsButene_1(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -11.309717975642364,        1.037;
      5.911539361818991,        1.176;
      -0.8939616477939638,        1.95;
      -2.3039589144938732,        3.798;
      -0.9566612009415151,        5.373;
      -1.297120238102156,        16.675],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      -1.1329161154078617,        0.226;
      4.576996342937427,        0.326;
      -2.35398267961107,        0.495;
      1.6095202242190951,        0.869;
      1.9936948858619448,        11.457;
      -8.666711070126212,        19.823],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -3.302882573914376,        0.429;
      -1.9359137327823328,        1.081;
      -4.362721415165588,        4.121;
      24.301821574494937,        15.125;
      -191.8377573940649,        18.011;
      174.69349121901325,        18.807])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Lemmon-FPE-2005</p>
<p>Viscosity and thermal conductivity: ECS plus correlations</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end Butene_1;

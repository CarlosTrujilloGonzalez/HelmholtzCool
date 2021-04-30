within HelmholtzMedia.HelmholtzFluidsAB;
package Benzene "Benzene"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="benzene" "short name",
  final fluidConstants={fluidConstantsBenzene},
  final helmholtzCoefficients=helmholtzCoefficientsBenzene,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsBenzene,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsBenzene,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsBenzene,
  final ancillaryCoefficients=ancillaryCoefficientsBenzene,
  final fluidLimits=fluidLimitsBenzene,
  final refSubstance=ReferenceSubstance.Propane,
  final referenceHelmholtzCoeff = HelmholtzFluidsPQ.Propane.helmholtzCoefficientsPropane,
  final referenceConstants =  HelmholtzFluidsPQ.Propane.fluidConstantsPropane,
  final referenceViscosityCoeff = HelmholtzFluidsPQ.Propane.dynamicViscosityCoefficientsPropane,
  final referenceConductivityCoeff = HelmholtzFluidsPQ.Propane.thermalConductivityCoefficientsPropane,
  Density(min=fluidLimitsBenzene.DMIN, max=fluidLimitsBenzene.DMAX, start=fluidConstantsBenzene.molarMass/fluidConstantsBenzene.criticalMolarVolume),
  Temperature(min=fluidLimitsBenzene.TMIN, max=fluidLimitsBenzene.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsBenzene.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsBenzene.HMIN, max=fluidLimitsBenzene.HMAX, start=(fluidLimitsBenzene.HMIN+fluidLimitsBenzene.HMAX)/2),
  SpecificEntropy(min=fluidLimitsBenzene.SMIN, max=fluidLimitsBenzene.SMAX, start=(fluidLimitsBenzene.SMIN+fluidLimitsBenzene.SMAX)/2));

  final constant FluidConstants
  fluidConstantsBenzene(
    casRegistryNumber="71-43-2",
    molarMass=0.07811180000000001,
    hasCriticalData=true,
       criticalTemperature=562.02,
       criticalPressure=4894000.0,
       criticalMolarVolume=0.00025627883136852895,
       HCRIT0=550826.4101454036,//CoolProp OK
       SCRIT0=1166.3528638556643,//CoolProp OK
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=0.0,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=true,
    hasAccurateConductivityData=true,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.2108369732700151,
    triplePointTemperature=278.674,
    triplePointPressure=4783.772578698541,
    normalBoilingPoint=353.22,
    meltingPoint=278.674) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsBenzene(
    TMIN=fluidConstantsBenzene.triplePointTemperature,
    TMAX=725,
    DMIN=Modelica.Constants.small,
    DMAX=894.38,//RefProp
    //DMAX=1062.47,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=500000000,
    HMIN=-1.4e5,
    HMAX=+1.24426e6,
    SMIN=-771,
    SMAX=17150.3) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsBenzene(
    idealLead={-0.6740687105, 2.5560188958},
    idealLog=[
      2.94645,         1.],
    idealEinstein=[
      7.36374,        -7.32358279064802;
      18.649,        -2.6885164229031;
      4.01834,        -1.120956549588983],
    idealIIRoffset={-13.7843, 5.62276},
    idealNBPoffset={-2.8421709430404e-12, 4.99600884354027e-11},
    residualPoly=[
      0.03513062,    1,    4;
      2.229707,    0.3,    1;
      -3.100459,    0.744,    1;
      -0.5763224,    1.174,    2;
      0.2504179,    0.68,    3],
    residualBwr=[
      -0.7049091,    2.5,    1,    2;
      -0.1393433,    3.67,    3,    2;
      0.8319673,    1.26,    2,    1;
      -0.3310741,    2.6,    2,    2;
      -0.02793578,    0.95,    7,    1],
    residualGauss=[
      0.7087408,    1,    1,    2,    2,    -1.032,    -1.867,    1.118,    0.7289;
      -0.3723906,    2.47,    1,    2,    2,    -1.423,    -1.766,    0.6392,    0.9074;
      -0.06267414,    3.35,    3,    2,    2,    -1.071,    -1.824,    0.6536,    0.7655;
      -0.86295,    0.75,    3,    2,    2,    -14.35,    -297.5,    1.164,    0.8711])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsBenzene(
    diluteTred=562.02,
    an=[
      0.101404,        0;
      -0.52144,        1;
      0.868266,        2],
    ad=[
      1,        0;
      9.714,        1;
      1.467,        2],
    diluteModel=2,
    residualTred=562.02,
    residualDred=304.7922436,
    b=[
      0.0282489,        0,        1,       0,       0;
      -0.0119268,        -1,        1,       0,       0;
      -0.0773415,        0,        2,       0,       0;
      0.0833389,        -1,        2,       0,       0;
      0.0714001,        0,        3,       0,       0;
      -0.0898176,        -1,        3,       0,       0;
      -0.0236798,        0,        4,       0,       0;
      0.0363025,        -1,        4,       0,       0;
      0.00300875,        0,        5,       0,       0;
      -0.00490052,        -1,        5,       0,       0],
    residualModel=2,
    Rd=1.02,
    qD=1612903225,
    zeta0=2.16e-10,
    Gamma=0.0569,
    gamma=1.239,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsBenzene(
    sigma=0.54,
    epsilon=412.0,
    diluteLead=2.1357e-08,
    a=[
      0.234018,        0;
      -0.476136,        1;
      -0.015269,        3],
    diluteModel=2,
    b=[
      -19.572881,        0,        0;
      219.73999,        -0.25,        0;
      -1015.3226,        -0.5,        0;
      2471.01251,        -0.75,        0;
      -3375.1717,        -1.0,        0;
      2491.6597,        -1.25,        0;
      -787.26086,        -1.5,        0;
      14.085455,        -2.5,        0;
      -0.34664158,        -5.5,        0],
    initialModel=2,
    residualModel=1
  );

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsBenzene(
    Tc=562.02,
    coeffs=[
      0.07298,        1.232;
      -0.0007802,        0.8635;
      -0.0001756,        0.3065]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsBenzene(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      0.005561906558935796,        0.037;
      -0.08662136922915314,        0.505;
      -6.964182734154488,        1.014;
      1.1249288132278856,        1.469;
      -3.961859460597414,        3.711;
      -13.106880507410812,        12.647],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      2.852587673922022,        0.407;
      -0.5596547795188646,        0.565;
      14.872052666571532,        4.029;
      -66.42959110979461,        5.699;
      1158.1329856052375,        9.989;
      -3128.774352224071,        12.299],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      0.016427739193323233,        0.067;
      -2.618439385733185,        0.387;
      -2.5904375872364365,        0.865;
      23.553523125085235,        2.692;
      -27.279655904334827,        2.792;
      -452.1839777043696,        15.611])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Thol-HTHP-2012</p>
<p>Viscosity: Avgeri-JPCRD-2014-Benzene</p>
<p>Conductivity: Assael-JPCRD-2012-Benzene</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end Benzene;

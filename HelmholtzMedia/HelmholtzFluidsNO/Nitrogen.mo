within HelmholtzMedia.HelmholtzFluidsNO;
package Nitrogen "Nitrogen"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="nitrogen" "short name",
  final fluidConstants={fluidConstantsNitrogen},
  final helmholtzCoefficients=helmholtzCoefficientsNitrogen,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsNitrogen,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsNitrogen,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsNitrogen,
  final ancillaryCoefficients=ancillaryCoefficientsNitrogen,
  final fluidLimits=fluidLimitsNitrogen,
  final refSubstance=ReferenceSubstance.None,
  final referenceHelmholtzCoeff = helmholtzCoefficients,
  final referenceConstants =  fluidConstants[1],
  Density(min=fluidLimitsNitrogen.DMIN, max=fluidLimitsNitrogen.DMAX, start=fluidConstantsNitrogen.molarMass/fluidConstantsNitrogen.criticalMolarVolume),
  Temperature(min=fluidLimitsNitrogen.TMIN, max=fluidLimitsNitrogen.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsNitrogen.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsNitrogen.HMIN, max=fluidLimitsNitrogen.HMAX, start=(fluidLimitsNitrogen.HMIN+fluidLimitsNitrogen.HMAX)/2),
  SpecificEntropy(min=fluidLimitsNitrogen.SMIN, max=fluidLimitsNitrogen.SMAX, start=(fluidLimitsNitrogen.SMIN+fluidLimitsNitrogen.SMAX)/2));

  final constant FluidConstants
  fluidConstantsNitrogen(
    casRegistryNumber="7727-37-9",
    molarMass=0.02801348,
    hasCriticalData=true,
       criticalTemperature=126.192,
       criticalPressure=3395800,
       criticalMolarVolume=8.941423555697418e-05,
       //HCRIT0=29256.45322723223,//CoolProp
       HCRIT0=29232.4,//EOS calculation
       //SCRIT0=4215.005463992114,//CoolProp
       SCRIT0=4214.84,//EOS calculation
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
       acentricFactor=0.0372,
    triplePointTemperature=63.151,
    triplePointPressure=12519.78348430944,
    normalBoilingPoint=77.355,
    meltingPoint=63.151) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsNitrogen(
    TMIN=fluidConstantsNitrogen.triplePointTemperature,
    TMAX=2000,
    DMIN=Modelica.Constants.small,
    DMAX=1489.0,//RefProp
    //DMAX=1433.0,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=2200000000,
    HMIN=-150734,
    HMAX=4.28697e6,
    SMIN=1388,
    SMAX=49474.5) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsNitrogen(
    idealLead={-12.76952708, -0.00784163},
    idealLog=[
      2.5,         1.],
    idealPower=[
      -0.0001934819,      -1;
      -1.247742e-05,      -2;
      6.678326e-08,      -3],
    idealEinstein=[
      1.012941,        -26.65788],
    idealNBPoffset={9.54897, 3.25779},
    residualPoly=[
      0.924803575275,    0.25,    1;
      -0.492448489428,    0.875,    1;
      0.661883336938,    0.5,    2;
      -1.92902649201,    0.875,    2;
      -0.0622469309629,    0.375,    3;
      0.349943957581,    0.75,    3],
    residualBwr=[
      0.564857472498,    0.5,    1,    1;
      -1.61720005987,    0.75,    1,    1;
      -0.481395031883,    2,    1,    1;
      0.421150636384,    1.25,    3,    1;
      -0.0161962230825,    3.5,    3,    1;
      0.172100994165,    1,    4,    1;
      0.00735448924933,    0.5,    6,    1;
      0.0168077305479,    3,    6,    1;
      -0.00107626664179,    0,    7,    1;
      -0.0137318088513,    2.75,    7,    1;
      0.000635466899859,    0.75,    8,    1;
      0.00304432279419,    2.5,    8,    1;
      -0.0435762336045,    4,    1,    2;
      -0.0723174889316,    6,    2,    2;
      0.0389644315272,    6,    3,    2;
      -0.021220136391,    3,    4,    2;
      0.00408822981509,    3,    5,    2;
      -5.51990017984e-05,    6,    8,    2;
      -0.0462016716479,    16,    4,    3;
      -0.00300311716011,    11,    5,    3;
      0.0368825891208,    15,    5,    3;
      -0.0025585684622,    12,    8,    3;
      0.00896915264558,    12,    3,    4;
      -0.0044151337035,    7,    5,    4;
      0.00133722924858,    4,    6,    4;
      0.000264832491957,    16,    9,    4],
    residualGauss=[
      19.6688194015,    0,    1,    2,    2,    -20,    -325,    1.16,    1;
      -20.911560073,    1,    1,    2,    2,    -20,    -325,    1.16,    1;
      0.0167788306989,    2,    3,    2,    2,    -15,    -300,    1.13,    1;
      2627.67566274,    3,    2,    2,    2,    -25,    -275,    1.25,    1])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsNitrogen(
    an=[
      0.001511,        0;
      0.002117,        -1.0;
      -0.003332,        -0.7],
    diluteModel=3,
    b=[
      0.008862,        0.0,        1,        0,        0;
      0.03111,        0.03,        2,        0,        0;
      -0.07313,        0.2,        3,        1,        1;
      0.02003,        0.8,        4,        1,        2;
      -0.0007096,        0.6,        8,        1,        2;
      0.0002672,        1.9,        10,        1,        2],
    residualModel=3,
    Tref=252.384,
    Rd=1.01,
    qD=2500000000.0,
    zeta0=1.7e-10,
    Gamma=0.055,
    gamma=1.2415,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsNitrogen(
    diluteLead=2.66958e-08,
    a=[
      0.431,        0;
      -0.4623,        1;
      0.08406,        2;
      0.005341,        3;
      -0.00331,        4],
    diluteModel=2,
    sigma=0.36560000000000004,
    epsilon=98.94,
    initialModel=0,
    residualTred=126.192,
    residualDMred=11183.9,
    dp=[
      1.072e-05,        2,        0.1,        0,        0;
      3.989e-08,        10,        0.25,        -1,        1;
      1.208e-09,        12,        3.2,        -1,        1;
      -7.402e-06,        2,        0.9,        -1,        2;
      4.62e-06,        1,        0.3,        -1,        3],
    bl=[
      0,        1,        0],
    b0n=[
      1,        0],
    b0d=[
      1,        0],
    residualModel=2);

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsNitrogen(
    Tc=126.192,
    coeffs=[
      0.02898,        1.246]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsNitrogen(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      7.557523110967278,        0.945;
      -15.31423072093374,        0.976;
      2.530452363947435,        1.134;
      -3.5464937257192077,        4.43;
      2.4443140451500853,        4.942;
      -1.089727092432518,        6.222],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      3.423788275604014,        0.396;
      -2.9664673074957677,        0.549;
      12.095926119341373,        1.037;
      -13.681823050784574,        1.209;
      4.19110684294756,        1.682;
      -0.6241396008655289,        2.819],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -2.412387653165135,        0.369;
      1.2535963572601478,        0.556;
      -6.375300212535008,        0.878;
      3.257106728291224,        1.049;
      -3.263645679265735,        4.174;
      1.2673447905058262,        6.303])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Span-JPCRD-2000</p>
<p>Viscosity: Lemmon-IJT-2004</p>
<p>Conductivity: Lemmon-IJT-2004</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end Nitrogen;

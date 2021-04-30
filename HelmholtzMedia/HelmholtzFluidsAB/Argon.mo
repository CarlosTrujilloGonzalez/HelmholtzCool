within HelmholtzMedia.HelmholtzFluidsAB;
package Argon "Argon"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="argon" "short name",
  final fluidConstants={fluidConstantsArgon},
  final helmholtzCoefficients=helmholtzCoefficientsArgon,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsArgon,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsArgon,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsArgon,
  final ancillaryCoefficients=ancillaryCoefficientsArgon,
  final fluidLimits=fluidLimitsArgon,
  final refSubstance=ReferenceSubstance.Nitrogen,
  final referenceHelmholtzCoeff = HelmholtzFluidsNO.Nitrogen.helmholtzCoefficientsNitrogen,
  final referenceConstants =  HelmholtzFluidsNO.Nitrogen.fluidConstantsNitrogen,
  final referenceViscosityCoeff = HelmholtzFluidsNO.Nitrogen.dynamicViscosityCoefficientsNitrogen,
  final referenceConductivityCoeff = HelmholtzFluidsNO.Nitrogen.thermalConductivityCoefficientsNitrogen,
  Density(min=fluidLimitsArgon.DMIN, max=fluidLimitsArgon.DMAX, start=fluidConstantsArgon.molarMass/fluidConstantsArgon.criticalMolarVolume),
  Temperature(min=fluidLimitsArgon.TMIN, max=fluidLimitsArgon.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsArgon.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsArgon.HMIN, max=fluidLimitsArgon.HMAX, start=(fluidLimitsArgon.HMIN+fluidLimitsArgon.HMAX)/2),
  SpecificEntropy(min=fluidLimitsArgon.SMIN, max=fluidLimitsArgon.SMAX, start=(fluidLimitsArgon.SMIN+fluidLimitsArgon.SMAX)/2));

  final constant FluidConstants
  fluidConstantsArgon(
    casRegistryNumber="7440-37-1",
    molarMass=0.039948,
    hasCriticalData=true,
       criticalTemperature=150.687,
       criticalPressure=4863000.0,
       criticalMolarVolume=7.458551157580286e-05,
       //HCRIT0=-4331.551085771,
       HCRIT0=-159457,
       //SCRIT0=2247.6366285980007,
       SCRIT0=-1625.81,
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
       acentricFactor=-0.00219,
    triplePointTemperature=83.806,
    triplePointPressure=68892.4770797671,
    normalBoilingPoint=87.28,
    meltingPoint=83.806) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsArgon(
    TMIN=fluidConstantsArgon.triplePointTemperature,
    TMAX=2000,
    DMIN=Modelica.Constants.small,
    DMAX=2023.36,//RefProp
    //DMAX=2027.47,
    PMIN=Modelica.Constants.small,
    PMAX=1000000000,
    HMIN=-2.8e5,
    HMAX=1.45194e6,
    SMIN=-3305.3,
    SMAX=29450.8) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsArgon(
    idealLead={8.31666243, -4.94651164},
    idealLog=[
      1.5,         1.],
    idealNBPoffset={-12.0055, 8.69404},
    residualPoly=[
      0.088722304990011,    0,    1;
      0.70514805167298,    0.25,    1;
      -1.682011565409,    1,    1;
      -0.14909014431486,    2.75,    1;
      -0.1202480460094,    4,    1;
      -0.12164978798599,    0,    2;
      0.40035933626752,    0.25,    2;
      -0.27136062699129,    0.75,    2;
      0.24211924579645,    2.75,    2;
      0.005788958318557,    0,    3;
      -0.041097335615341,    2,    3;
      0.024710761541614,    0.75,    4],
    residualBwr=[
      -0.32181391750702,    3,    1,    1;
      0.33230017695794,    3.5,    1,    1;
      0.031019986287345,    1,    3,    1;
      -0.030777086002437,    2,    4,    1;
      0.093891137419581,    4,    4,    1;
      -0.090643210682031,    3,    5,    1;
      -0.00045778349276654,    0,    7,    1;
      -8.2659729025197e-05,    0.5,    10,    1;
      0.00013013415603147,    1,    10,    1;
      -0.011397840001996,    1,    2,    2;
      -0.024455169960535,    7,    2,    2;
      -0.064324067175955,    5,    4,    2;
      0.058889471093674,    6,    4,    2;
      -0.00064933552112965,    6,    8,    2;
      -0.013889862158435,    10,    3,    3;
      0.4048983929691,    13,    5,    3;
      -0.38612519594749,    14,    5,    3;
      -0.18817142332233,    11,    6,    3;
      0.15977647596482,    14,    6,    3;
      0.053985518513856,    8,    7,    3;
      -0.028953417958014,    14,    7,    3;
      -0.013025413381384,    6,    8,    3;
      0.0028948696775778,    7,    9,    3;
      -0.0022647134304796,    24,    5,    4;
      0.0017616456196368,    22,    6,    4],
    residualGauss=[
      0.0058552454482774,    3,    2,    2,    2,    -20,    -250,    1.11,    1;
      -0.69251908270028,    1,    1,    2,    2,    -20,    -375,    1.14,    1;
      1.5315490030516,    0,    2,    2,    2,    -20,    -300,    1.17,    1;
      -0.0027380447449783,    0,    3,    2,    2,    -20,    -225,    1.11,    1])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsArgon(
    an=[
      0.0008158,        0;
      -0.000432,        -0.77],
    diluteModel=3,
    b=[
      0.01373,        0.0,        1,        0,        0;
      0.01007,        0.0,        2,        0,        0;
      0.0007375,        0.0,        4,        0,        0;
      -0.03396,        0.8,        5,        1,        2;
      0.02047,        1.2,        6,        1,        2;
      -0.002274,        0.8,        9,        1,        2;
      -0.003973,        0.5,        1,        1,        4],
    residualModel=3,
    Tref=301.374,
    Rd=1.01,
    qD=3125000000.0,
    zeta0=1.3e-10,
    Gamma=0.055,
    gamma=1.2415,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsArgon(
    sigma=0.33499999999999996,
    epsilon=143.2,
    diluteLead=2.66958e-08,
    a=[
      0.431,        0;
      -0.4623,        1;
      0.08406,        2;
      0.005341,        3;
      -0.00331,        4],
    diluteModel=2,
    residualTred=150.687,
    residualDMred=13407.43,
    dp=[
      1.219e-05,        1,        0.42,        0,        0;
      1.399e-05,        2,        0.0,        0,        0;
      5.027e-09,        10,        0.95,        0,        0;
      -1.893e-05,        5,        0.5,        -1,        2;
      -6.698e-06,        1,        0.9,        -1,        4;
      -3.827e-06,        2,        0.8,        -1,        4],
    bl=[
      0,        1,        0],
    b0n=[
      1,        0],
    b0d=[
      1,        0],
    residualModel=2);

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsArgon(
    Tc=150.687,
    coeffs=[
      0.037,        1.25]) "Coefficients for the surface tension";
      
  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsArgon(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      1.274555697445016,        0.841;
      -6.537350082824229,        0.944;
      2.3992572216415304,        2.449;
      -2.853795528373302,        2.797;
      -1.4260480922698553,        6.335;
      -1.2865724148178292,        10.499],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      0.35549443267848707,        0.272;
      1.7740534055789645,        0.417;
      1.6692402958603285,        2.551;
      -1326.972748274678,        7.589;
      3248.4827767066654,        8.392;
      -4246.807908907579,        10.436],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      1.1883246645329462,        0.29;
      -3.0995804610072724,        0.329;
      -2.5097036910932267,        0.839;
      0.6796303921537137,        2.946;
      -21.203752823276112,        6.496;
      418.9717120034111,        11.57])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Tegeler-JPCRD-1999</p>
<p>Viscosity: Lemmon-IJT-2004</p>
<p>Conductivity: Lemmon-IJT-2004</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end Argon;

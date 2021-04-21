within HelmholtzMedia.HelmholtzFluids;
package MM "MM"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="mm" "short name",
  final fluidConstants={fluidConstantsMM},
  final helmholtzCoefficients=helmholtzCoefficientsMM,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsMM,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsMM,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsMM,
  final ancillaryCoefficients=ancillaryCoefficientsMM,
  final fluidLimits=fluidLimitsMM,
  Density(min=fluidLimitsMM.DMIN, max=fluidLimitsMM.DMAX, start=fluidConstantsMM.molarMass/fluidConstantsMM.criticalMolarVolume),
  Temperature(min=fluidLimitsMM.TMIN, max=fluidLimitsMM.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsMM.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsMM.HMIN, max=fluidLimitsMM.HMAX, start=(fluidLimitsMM.HMIN+fluidLimitsMM.HMAX)/2),
  SpecificEntropy(min=fluidLimitsMM.SMIN, max=fluidLimitsMM.SMAX, start=(fluidLimitsMM.SMIN+fluidLimitsMM.SMAX)/2));

  /*final constant FluidConstants
  fluidConstantsMM(
    casRegistryNumber="107-46-0",
    molarMass=0.16237752,
    hasCriticalData=true,
       criticalTemperature=518.7,
       criticalPressure=1931130,
       criticalMolarVolume=0.0006049606775559589,
       //HCRIT0=365125.47064458113,//CoolProp
       HCRIT0=653270,//EOS calculation
       //SCRIT0=806.5470226784862,//CoolProp
       SCRIT0=4520.84,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=0.0,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=false,
    hasAccurateConductivityData=false,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.418,
    triplePointTemperature=204.93,
    triplePointPressure=2.9537701302689663,
    normalBoilingPoint=373.401,
    meltingPoint=204.93) "Fluid Constants";*/
  final constant FluidConstants
  fluidConstantsMM(
    chemicalFormula="C6H18OSi2",
    structureFormula="",
    casRegistryNumber="107-46-0",
    iupacName="",
    molarMass=0.16237752,
    hasCriticalData=true,
       criticalTemperature=518.69997204,
       criticalPressure=1939390,
       criticalMolarVolume=1/1874.67076,
       HCRIT0=364989.364617502,
       SCRIT0=806.290249664929,
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=false,
       dipoleMoment=-1,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=true,
    hasAccurateConductivityData=true,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.418,
    triplePointTemperature=204.93,
    triplePointPressure=0002.69,
    normalBoilingPoint=373.401,
    meltingPoint=204.93) "Fluid Constants";

  /*final constant FluidLimits
  fluidLimitsMM(
    TMIN=273,
    TMAX=673,
    DMIN=Modelica.Constants.small,
    //DMAX=845.99,//RefProp
    DMAX=817.91,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=30000000,
    HMIN=100000,
    HMAX=1.0e6,
    SMIN=1000,//3030,
    SMAX=5761) "Helmholtz EoS Limits";*/
    
  final constant FluidLimits
  fluidLimitsMM(
    TMIN=273,
    TMAX=673,
    DMIN=Modelica.Constants.small,
    DMAX=844,
    PMIN=Modelica.Constants.small,
    PMAX=30e6,
    HMIN=-100e3,
    HMAX=+1300e3,
    SMIN=-465,
    SMAX=8100) "Helmholtz EoS Limits";

  /*final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsMM(
    idealLead={0, 0},
    idealLog=[
      3,         1.],
    idealEinstein=[
      19.74,        -6.940427993;
      29.58,        -2.699055331;
      18.59,        -0.038557933;
      4.87,        -12.14574899],
    idealNBPoffset={72.1107541562, -10.4314993483},
    residualPoly=[
      0.05063651,    1,    4;
      8.604724,    0.346,    1;
      -9.179684,    0.46,    1;
      -1.146325,    1.01,    2;
      0.4878559,    0.59,    3],
    residualBwr=[
      -2.434088,    2.6,    1,    2;
      -1.621326,    3.33,    3,    2;
      0.6239872,    0.75,    2,    1;
      -2.306057,    2.95,    2,    2;
      -0.05555096,    0.93,    7,    1],
    residualGauss=[
      9.385015,    1.33,    1,    2,    2,    -1.0334,    -0.4707,    1.7754,    0.8927;
      -2.493508,    1.68,    1,    2,    2,    -1.544,    -0.32,    0.692,    0.5957;
      -3.308032,    1.7,    3,    2,    2,    -1.113,    -0.404,    1.242,    0.559;
      -0.1885803,    3.08,    3,    2,    2,    -1.113,    -0.517,    0.421,    1.056;
      -0.09883865,    5.41,    1,    2,    2,    -1.11,    -0.432,    0.406,    1.3;
      0.111109,    1.4,    2,    2,    2,    -7.2,    -7.2,    0.163,    0.106;
      0.1061928,    1.1,    3,    2,    2,    -1.45,    -1.2,    0.795,    0.181;
      -0.01452454,    5.3,    1,    2,    2,    -4.73,    -35.8,    0.88,    0.525])
  "Coefficients of the Helmholtz EoS";*/

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsMM(
    idealLog=[
      +51.894/8.314472-1,           1],
    idealPower=[
      +27.190399518670160,                       0;
      -7.3982398876225090,                       1;
      -741.34e-3/8.314472 /2 *518.69997204^1,   -1;
      +416.10e-6/8.314472 /6 *518.69997204^2,   -2;
      -70.000e-9/8.314472 /12*518.69997204^3,   -3],
    idealEinstein=fill(0.0, 0, 2),
    idealIIRoffset={-31.5114, 14.9675},
    idealNBPoffset={0, 0},
    residualPoly=[
       1.01686012,       0.25,    1;
      -2.19713029,       1.125,   1;
       0.75443188,       1.5,     1;
      -0.68003426,       1.375,   2;
       0.19082162,       0.25,    3;
       0.10530133E-2,    0.875,   7],
    residualBwr=[
       0.62845950,       0.625,   2,   1;
       0.30903042E-1,    1.75,    5,   1;
      -0.83948727,       3.625,   1,   2;
      -0.20262381,       3.625,   4,   2;
      -0.35131597E-1,   14.5,     3,   3;
       0.25902341E-1,   12.0,     4,   3],
     residualGauss=fill(0.0, 0, 9)) "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsMM(
    corrG=121,
    coefG={-1.623E-05,1.5531E-05,8.854E-08,-3.5689E-11,0.0},
    diluteModel=10,
    corrL=50,
    coefL={2.984E-01,-1.34656E-03,3.83142E-06,-6.13382E-09,3.79368E-12},
    residualModel=10,
    qD=1.046E+09,
    zeta0=2.95e-10,
    Gamma=0.064,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsMM(
    corrG=111,
    coefG={2.2279E-07,2.1132E-08,1.0737E-12,-1.8438E-15,0.0},
    diluteModel=10,
    corrL=30,
    coefL={-2.27144E+01,7.48396E+02,2.45344,-1.58496E-05,2.000E+00},
    residualModel=10  );

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsMM(
    Tc=518.75,
    coeffs=[
      0.04576,        1.272]) "Coefficients for the surface tension";

  /*final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsMM(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -4.060293696270762,        0.37949999999999995;
      4.510185129815067,        0.39249999999999996;
      -4.885232278579032,        0.8333333333333334;
      -2.6822903046438245,        1.1666666666666667;
      -5.299617058057907,        3.5;
      -0.6930990905959292,        7.0],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      -8303.078722649547,        0.053000000000000005;
      19907.82160633168,        0.060000000000000005;
      -58594.419720744074,        0.07300000000000001;
      46994.93794195376,        0.07500000000000001;
      -3.7736967695961456,        0.38149999999999995;
      1.5306273870930966,        1.0],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      1.9064998880167185,        0.069;
      -2.8523897486872647,        0.11800000000000001;
      -0.5934746441822841,        0.374;
      -5.144563593564645,        0.8333333333333334;
      1.0148163085613484,        1.3333333333333333;
      -7.087704476079893,        3.5])
  "Coefficients for the ancillary equations";*/
  
  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsMM(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -0.86671E+01,   1.0;
       0.11649E+02,   1.5;
      -0.11484E+02,   1.65;
      -0.53256E+01,   4.5],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
       0.14533E+02,   0.584;
      -0.49804E+02,   0.80;
       0.83748E+02,   1.02;
      -0.70321E+02,   1.26;
       0.24283E+02,   1.50],
    densityVaporModel=DensityVaporModel.DV3,
    densityVapor=[
      -0.35719E+01,   0.373;
      -0.14740E+03,   2.15;
       0.40699E+03,   2.6;
      -0.69676E+03,   3.3;
       0.12541E+04,   4.2;
      -0.91199E+03,   4.6])
  "Coefficients for the ancillary equations (PS5, DL1, DV3)";
  
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>The EOS: Thol-FPE-2016-MM,Thol-THESIS-2015 has convergence problems. Used the original one</p>
<p>Surface tension: Mulero-JPCRD-2014</p>
</body>
  </html>"));
end MM;

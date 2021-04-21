within HelmholtzMedia.HelmholtzFluids;
package CarbonMonoxide "CarbonMonoxide"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="carbonmonoxide" "short name",
  final fluidConstants={fluidConstantsCarbonMonoxide},
  final helmholtzCoefficients=helmholtzCoefficientsCarbonMonoxide,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsCarbonMonoxide,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsCarbonMonoxide,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsCarbonMonoxide,
  final ancillaryCoefficients=ancillaryCoefficientsCarbonMonoxide,
  final fluidLimits=fluidLimitsCarbonMonoxide,
  Density(min=fluidLimitsCarbonMonoxide.DMIN, max=fluidLimitsCarbonMonoxide.DMAX, start=fluidConstantsCarbonMonoxide.molarMass/fluidConstantsCarbonMonoxide.criticalMolarVolume),
  Temperature(min=fluidLimitsCarbonMonoxide.TMIN, max=fluidLimitsCarbonMonoxide.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsCarbonMonoxide.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsCarbonMonoxide.HMIN, max=fluidLimitsCarbonMonoxide.HMAX, start=(fluidLimitsCarbonMonoxide.HMIN+fluidLimitsCarbonMonoxide.HMAX)/2),
  SpecificEntropy(min=fluidLimitsCarbonMonoxide.SMIN, max=fluidLimitsCarbonMonoxide.SMAX, start=(fluidLimitsCarbonMonoxide.SMIN+fluidLimitsCarbonMonoxide.SMAX)/2));

  final constant FluidConstants
  fluidConstantsCarbonMonoxide(
    casRegistryNumber="630-08-0",
    molarMass=0.0280101,
    hasCriticalData=true,
       criticalTemperature=132.86,
       criticalPressure=3494000,
       criticalMolarVolume=9.216589861751152e-05,
       //HCRIT0=164733.03007659342,//CoolProp
       HCRIT0=177358,//EOS calculation
       //SCRIT0=1429.5311822789474,//CoolProp
       SCRIT0=1524.73,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=0.1,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=false,
    hasAccurateConductivityData=false,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.0497,
    triplePointTemperature=68.16,
    triplePointPressure=15536.876656446813,
    normalBoilingPoint=81.64,
    meltingPoint=68.16) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsCarbonMonoxide(
    TMIN=fluidConstantsCarbonMonoxide.triplePointTemperature,
    TMAX=500,
    DMIN=Modelica.Constants.small,
    //DMAX=947.86,//RefProp
    DMAX=952.94,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=100000000,
    HMIN=-3e4,
    HMAX=687933,
    SMIN=-750,
    SMAX=6597) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsCarbonMonoxide(
    idealLead={-3.3728318564, 3.3683460039},
    idealLog=[
      2.5,         1.],
    idealPower=[
      -9.111274701235156e-05,      -1.5],
    idealEinstein=[
      1.0128,        -23.25003763359927],
    idealIIRoffset={3.62008, -4.14134},
    idealNBPoffset={0, 0},
    residualPoly=[
      0.90554,    0.25,    1;
      -2.4515,    1.125,    1;
      0.53149,    1.5,    1;
      0.024173,    1.375,    2;
      0.072156,    0.25,    3;
      0.00018818,    0.875,    7],
    residualBwr=[
      0.19405,    0.625,    2,    1;
      -0.043268,    1.75,    5,    1;
      -0.12778,    3.625,    1,    2;
      -0.027896,    3.625,    4,    2;
      -0.034154,    14.5,    3,    3;
      0.016329,    12,    4,    3])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsCarbonMonoxide(
    corrG=120,
    coefG={5.9882E-04,6.863E-01,5.713E+01,5.0192E+02,0.0},
    diluteModel=10,
    corrL=51,
    coefL={-2.3621E-01,-3.5251,-5.5788E-01,-3.9362E-03,-8.2725E-06},
    residualModel=10,
    qD=2.288E+09,
    zeta0=1.64e-10,
    Gamma=0.059,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsCarbonMonoxide(
    corrG=111,
    coefG={1.384E-07,7.4306E-08,-6.2996E-11,3.948E-14,-1.032E-17},
    diluteModel=10,
    corrL=30,
    coefL={-8.2158E+01,1.0378E+03,1.4229E+01,-2.8204E-04,2.000E+00},
    residualModel=10  );

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsCarbonMonoxide(
    Tc=132.86,
    coeffs=[
      0.02843,        1.148]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsCarbonMonoxide(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      0.0031655594711161982,        0.052;
      -5.386279334978247,        0.968;
      -0.44089436177701297,        1.972;
      1.5403401817486662,        2.761;
      -5.692323589833758,        4.199;
      3.03081959067228,        5.126],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      3.973336124071812,        0.44;
      -3.262687458485425,        0.672;
      3.3499432070659303,        1.334;
      -42.129174166388935,        3.874;
      56.52859432308481,        4.413;
      -110.70022756120696,        9.257],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -3.6459289142239206,        0.444;
      1.5167962228564473,        0.75;
      -114.10174052209382,        1.847;
      292.7876490687851,        2.04;
      -183.6056308954516,        2.169;
      4746.634272544051,        19.966])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Lemmon-JCED-2006</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end CarbonMonoxide;

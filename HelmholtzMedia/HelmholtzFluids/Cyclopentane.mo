within HelmholtzMedia.HelmholtzFluids;
package Cyclopentane "Cyclopentane"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="cyclopentane" "short name",
  final fluidConstants={fluidConstantsCyclopentane},
  final helmholtzCoefficients=helmholtzCoefficientsCyclopentane,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsCyclopentane,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsCyclopentane,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsCyclopentane,
  final ancillaryCoefficients=ancillaryCoefficientsCyclopentane,
  final fluidLimits=fluidLimitsCyclopentane,
  Density(min=fluidLimitsCyclopentane.DMIN, max=fluidLimitsCyclopentane.DMAX, start=fluidConstantsCyclopentane.molarMass/fluidConstantsCyclopentane.criticalMolarVolume),
  Temperature(min=fluidLimitsCyclopentane.TMIN, max=fluidLimitsCyclopentane.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsCyclopentane.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsCyclopentane.HMIN, max=fluidLimitsCyclopentane.HMAX, start=(fluidLimitsCyclopentane.HMIN+fluidLimitsCyclopentane.HMAX)/2),
  SpecificEntropy(min=fluidLimitsCyclopentane.SMIN, max=fluidLimitsCyclopentane.SMAX, start=(fluidLimitsCyclopentane.SMIN+fluidLimitsCyclopentane.SMAX)/2));

  final constant FluidConstants
  fluidConstantsCyclopentane(
    casRegistryNumber="287-92-3",
    molarMass=0.07013290000000001,
    hasCriticalData=true,
       criticalTemperature=511.72,
       criticalPressure=4571200,
       criticalMolarVolume=0.0002617801047120418,
       //HCRIT0=542646.2634250382,//CoolProp
       HCRIT0=540794,//EOS calculation
       //SCRIT0=1254.724394349802,//CoolProp
       SCRIT0=1251.13,//EOS calculation
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
       acentricFactor=0.201112573380599,
    triplePointTemperature=179.70000000000002,
    triplePointPressure=8.854271413109606,
    normalBoilingPoint=322.4,
    meltingPoint=179.70000000000002) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsCyclopentane(
    TMIN=fluidConstantsCyclopentane.triplePointTemperature,
    TMAX=550,
    DMIN=Modelica.Constants.small,
    DMAX=855.62,//RefProp
    PMIN=Modelica.Constants.small,
    PMAX=250000000,
    HMIN=-2.4e5,
    HMAX=7.5e5,
    SMIN=-1160e3,
    SMAX=2900) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsCyclopentane(
    idealLead={3.2489131288, 2.6444166315},
    idealLog=[
      0.96,         1.],
    idealEinstein=[
      3.34,        -0.2345032439615415;
      18.6,        -2.540451809583366;
      13.9,        -5.276322989134683;
      4.86,        -10.35722660830141],
    idealIIRoffset={-10.9639, 4.76963},
    idealNBPoffset={0, 0},
    residualPoly=[
      0.0536938,    1,    4;
      1.60394,    0.29,    1;
      -2.41244,    0.8,    1;
      -0.474009,    1.14,    2;
      0.203482,    0.5,    3],
    residualBwr=[
      -0.965616,    2,    1,    2;
      -0.344543,    1.5,    3,    2;
      0.353975,    1,    2,    1;
      -0.231373,    3.36,    2,    2;
      -0.0379099,    0.95,    7,    1],
    residualGauss=[
      0.867586,    1,    1,    2,    2,    -0.82,    -1.15,    1.08,    0.68;
      -0.381827,    2.5,    1,    2,    2,    -1.19,    -1.61,    0.36,    0.97;
      -0.108741,    2.5,    3,    2,    2,    -0.79,    -0.66,    0.09,    0.84;
      -0.0976984,    1.5,    3,    2,    2,    -1.52,    -2.72,    1.48,    0.66])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsCyclopentane(
    diluteTred=511.72,
    an=[
      -0.0082523346,        0;
      0.07633654,        1;
      -0.2176154,        2;
      0.31229877,        3],
    ad=[
      1,        0;
      0.28341479,        1;
      2.7890541,        2;
      0.32645005,        3],
    diluteModel=2,
    residualTred=511.72,
    residualDred=274.921,
    b=[
      0.0920536,        0,        1,       0,       0;
      -0.0435129,        -1,        1,       0,       0;
      -0.172699,        0,        2,       0,       0;
      0.112636,        -1,        2,       0,       0;
      0.126557,        0,        3,       0,       0;
      -0.0908663,        -1,        3,       0,       0;
      -0.0362296,        0,        4,       0,       0;
      0.028095,        -1,        4,       0,       0;
      0.00388718,        0,        5,       0,       0;
      -0.00280368,        -1,        5,       0,       0],
    residualModel=2,
    Rd=1.02,
    qD=1602564102.5641024,
    zeta0=2.16e-10,
    Gamma=0.058,
    gamma=1.239,
    criticalModel=2);

  /*final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsCyclopentane(
    //correlation alternative that seems better than Chung at low temperature 
    diluteTred=511.72,
    acentric=0.1521,
    dipole=0.0,
    kappa=0.0,
    MM=0.0701329,
    diluteModel=6,
    initialModel=0,
    residualTred=511.72,
    residualDMred=3820.0,
    corrL=32,
    coefL={-0.5385,2.5255E+02,-2.3007E-03,-2.3062E-07,0.0},
    residualModel=10  );*/
    
  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsCyclopentane(
    diluteTred=511.72,
    acentric=0.1521,
    dipole=0.0,
    kappa=0.0,
    MM=0.0701329,
    diluteModel=6,
    initialModel=0,
    residualTred=511.72,
    residualDMred=3820.0,
    residualModel=6);

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsCyclopentane(
    Tc=511.72,
    coeffs=[
      0.07348,        1.388]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsCyclopentane(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -9.601889908950373,        1.041;
      3.974125106492668,        1.3;
      2.6925579604302676,        1.87;
      -4.621940458120144,        2.257;
      -5.157782358169021,        5.99;
      3.340182642033233,        6.955],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      4.175321169438228,        0.545;
      -3.3972763608243954,        1.142;
      3.265444750596592,        2.232;
      -14.140653461920774,        6.456;
      419.1357335784064,        11.186;
      -484.6437448434436,        11.952],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -5.935725453092267,        0.602;
      1.591120947182766,        1.076;
      -8.958815994240467,        3.895;
      198.61227335356796,        8.292;
      -245.69777423593865,        8.939;
      469.5550522878147,        18.105])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Gedanitz-JCED-2015</p>
<p>Viscosity: Chung-IECR-1988</p>
<p>Conductivity: Vassiliou-JPCRD-2015-pentanes</p>
<p>Surface tension: Mulero-JPCRD-2014</p>
</body>
  </html>"));
end Cyclopentane;

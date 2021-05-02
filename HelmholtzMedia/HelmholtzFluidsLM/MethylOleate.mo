within HelmholtzMedia.HelmholtzFluidsLM;
package MethylOleate "MethylOleate"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="methyloleate" "short name",
  final fluidConstants={fluidConstantsMethylOleate},
  final helmholtzCoefficients=helmholtzCoefficientsMethylOleate,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsMethylOleate,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsMethylOleate,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsMethylOleate,
  final ancillaryCoefficients=ancillaryCoefficientsMethylOleate,
  final fluidLimits=fluidLimitsMethylOleate,
  final refSubstance=ReferenceSubstance.Propane,
  final referenceHelmholtzCoeff = Transport.ECSreferences.helmholtzCoefficientsPropane,
  referenceConstants =  Transport.ECSreferences.fluidConstantsPropane,
  referenceViscosityCoeff = Transport.ECSreferences.dynamicViscosityCoefficientsPropane,
  referenceConductivityCoeff = Transport.ECSreferences.thermalConductivityCoefficientsPropane,
  Density(min=fluidLimitsMethylOleate.DMIN, max=fluidLimitsMethylOleate.DMAX, start=fluidConstantsMethylOleate.molarMass/fluidConstantsMethylOleate.criticalMolarVolume),
  Temperature(min=fluidLimitsMethylOleate.TMIN, max=fluidLimitsMethylOleate.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsMethylOleate.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsMethylOleate.HMIN, max=fluidLimitsMethylOleate.HMAX, start=(fluidLimitsMethylOleate.HMIN+fluidLimitsMethylOleate.HMAX)/2),
  SpecificEntropy(min=fluidLimitsMethylOleate.SMIN, max=fluidLimitsMethylOleate.SMAX, start=(fluidLimitsMethylOleate.SMIN+fluidLimitsMethylOleate.SMAX)/2));

  final constant FluidConstants
  fluidConstantsMethylOleate(
    casRegistryNumber="112-62-9",
    molarMass=0.29648794,
    hasCriticalData=true,
       criticalTemperature=782,
       criticalPressure=1246000,
       criticalMolarVolume=0.0012302392815402598,
       //HCRIT0=534000.9849980918,//CoolProp
       HCRIT0=1.28372e6,//EOS calculation
       //SCRIT0=750.3048076196252,//CoolProp
       SCRIT0=7232.99,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=1.63,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=false,
    hasAccurateConductivityData=false,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.9058493599879012,
    triplePointTemperature=253.47,
    triplePointPressure=4.571708015418045e-07,
    normalBoilingPoint=627.18,
    meltingPoint=253.47) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsMethylOleate(
    TMIN=fluidConstantsMethylOleate.triplePointTemperature,
    TMAX=1000,
    DMIN=Modelica.Constants.small,
    DMAX=904.29,//RefProp
    //DMAX=926.2,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=50000000,
    HMIN=-191676,
    HMAX=2.07112e6,
    SMIN=4250.21,
    SMAX=12100.3) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsMethylOleate(
    idealLead={-1, 0},
    idealLog=[
      -1,         1.],
    Tc=782,
    T0=298,
    idealCpPolyT=[
      10.85318466404121,        0.146118],
    idealEinstein=[
      28.23955628210667,        -0.7845639386189258;
      40.38356254011078,        -1.797071611253197;
      51.91670619613609,        -3.667212276214834],
    //idealNBPoffset={60.4208015509131, -25.9023485195146},//CoolProp
    residualPoly=[
      0.04596121,    1,    4;
      2.2954,    0.34,    1;
      -3.554366,    1.14,    1;
      -0.2291674,    1.4,    2;
      0.06854534,    0.6,    3],
    residualBwr=[
      -1.535778,    3.3,    1,    2;
      -0.7334697,    4.1,    3,    2;
      1.7127,    1.9,    2,    1;
      -1.471394,    3.8,    2,    2;
      -0.01724678,    1.3,    7,    1],
    residualGauss=[
      2.11547,    3.4,    1,    2,    2,    -1.1,    -0.9,    1.14,    0.79;
      -0.7555374,    3.8,    1,    2,    2,    -1.6,    -0.65,    0.65,    0.9;
      -0.4134269,    4,    3,    2,    2,    -1.1,    -0.75,    0.77,    0.76])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsMethylOleate(
    diluteTred=782.0,
    an=[
    -0.000271250,   0.0;
    0.00259365,     1.0;
    0.0350241,      2.0;
    -0.00902273,      3.0
    ],
    ad=[1,0],
    diluteModel=2,
    residualTred=782.0,
    residualDred=241.0,
    b=[
    -41.0106,60.6657,0.0,0.0,0.0;
    32.8443,-49.8407,0.0,0.0,0.0;
    -4.18506,12.1752,0.0,0.0,0.0],
    residualModel=4,
    qD=1142857142,
    zeta0=1.94e-10,
    Gamma=0.0496,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsMethylOleate(
    epsilon=620.98,
    sigma=0.8668,
    Fc=1.0,
    diluteModel=3,
    initialModel=0,
    nistCoeff={1.92477,-0.515884,0.0703972},
    residualModel=9);
  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsMethylOleate(
    Tc=782.0,
    coeffs=[
      0.0565,        1.31]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsMethylOleate(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      14.372838414798984,        0.868;
      -25.63700682166794,        0.906;
      6.6378551150443315,        1.48;
      -11.23105485250874,        2.404;
      -7.468648794751394,        5.545;
      -12.617144053602795,        12.862],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      -31.454521040135862,        0.506;
      43.736786126817,        0.525;
      -12.491996989544091,        0.762;
      23.664196742286585,        2.134;
      -120.4823599211856,        2.905;
      101.35825428360955,        3.06],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -8.749977488567636,        0.587;
      146.83338074209553,        2.009;
      -279.87451233611756,        2.281;
      163.6376571116443,        2.773;
      -46.10327133274694,        3.897;
      -23.68509985467464,        19.484])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Huber-EF-2009</p>
<p>Surface tension: Mulero-JPCRD-2014</p>
</body>
  </html>"));
end MethylOleate;

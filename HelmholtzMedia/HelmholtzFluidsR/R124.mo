within HelmholtzMedia.HelmholtzFluidsR;
package R124 "R124"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="r124" "short name",
  final fluidConstants={fluidConstantsR124},
  final helmholtzCoefficients=helmholtzCoefficientsR124,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsR124,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsR124,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsR124,
  final ancillaryCoefficients=ancillaryCoefficientsR124,
  final fluidLimits=fluidLimitsR124,
  final refSubstance=ReferenceSubstance.Propane,
  final referenceHelmholtzCoeff = HelmholtzFluidsPQ.Propane.helmholtzCoefficientsPropane,
  final referenceConstants =  HelmholtzFluidsPQ.Propane.fluidConstantsPropane,
  final referenceViscosityCoeff = HelmholtzFluidsPQ.Propane.dynamicViscosityCoefficientsPropane,
  final referenceConductivityCoeff = HelmholtzFluidsPQ.Propane.thermalConductivityCoefficientsPropane,
  Density(min=fluidLimitsR124.DMIN, max=fluidLimitsR124.DMAX, start=fluidConstantsR124.molarMass/fluidConstantsR124.criticalMolarVolume),
  Temperature(min=fluidLimitsR124.TMIN, max=fluidLimitsR124.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsR124.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsR124.HMIN, max=fluidLimitsR124.HMAX, start=(fluidLimitsR124.HMIN+fluidLimitsR124.HMAX)/2),
  SpecificEntropy(min=fluidLimitsR124.SMIN, max=fluidLimitsR124.SMAX, start=(fluidLimitsR124.SMIN+fluidLimitsR124.SMAX)/2));

  final constant FluidConstants
  fluidConstantsR124(
    casRegistryNumber="2837-89-0",
    molarMass=0.1364762,
    hasCriticalData=true,
       criticalTemperature=395.425,
       criticalPressure=3624295,
       criticalMolarVolume=0.0002437075,
       //HCRIT0=378835.56837793486,//CoolProp
       HCRIT0=378791,//EOS calculation
       //SCRIT0=1515.6875581729303,//CoolProp
       SCRIT0=1515.58,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=1.469,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=true,
    hasAccurateConductivityData=true,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.2880950842214292,
    triplePointTemperature=120.0,
    triplePointPressure=0.026738623617928323,
    normalBoilingPoint=261.187,
    meltingPoint=120.0) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsR124(
    TMIN=fluidConstantsR124.triplePointTemperature,
    TMAX=470,
    DMIN=Modelica.Constants.small,
    DMAX=1852.8,//RefProp
    //DMAX=1884.19,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=40000000,
    HMIN=49104.1,
    HMAX=525746,
    SMIN=198.564,
    SMAX=10558.9) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsR124(
    idealLead={-11.669406, 9.8760443},
    idealLog=[
      2.175638,         1.],
    idealPower=[
      -7.389735,      -1;
      0.8736831,      -2;
      -0.1115133,      -3],
    idealASHRAEoffset={13.6901, -6.55658},
    idealIIRoffset={-0.000144036507408073, 7.30088431548676e-05},
    idealNBPoffset={15.6274, -7.76873},
    residualPoly=[
      -0.01262962,    2,    1;
      2.168373,    0.5,    1;
      -3.330033,    1,    1;
      0.1610361,    0.5,    2;
      -9.666145e-05,    2.5,    2;
      0.0119131,    -1,    3;
      -0.002880217,    1,    5;
      0.001681346,    0,    6;
      1.594968e-05,    -0.5,    8],
    residualBwr=[
      0.1289674,    1.5,    2,    1;
      1.182213e-05,    1,    12,    1;
      -0.4713997,    2.5,    1,    2;
      -0.2412873,    -0.25,    1,    2;
      0.6868066,    1,    1,    2;
      -0.08621095,    5,    1,    2;
      4.728645e-06,    2,    15,    2;
      0.01487933,    15,    3,    3;
      -0.03001338,    20,    3,    3;
      0.001849606,    15,    4,    4;
      0.0004126073,    45,    9,    4])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsR124(
    ai={0.0011769,6.78397e-7},
    diluteModel=9,
    nistCoeff={1.0898,-0.0154229},
    residualModel=9,
    criticalModel=2
  );

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsR124(
    epsilon=275.8,
    sigma=0.5501,
    Fc=1.0,
    diluteModel=3,
    initialModel=0,
    C=0.99792,
    clg=[
      0.6100913843,        0.0;
      0.4508958312,        1.2;
      -0.017063,        -0.308598;
      0.000564,        0.035317],
    rhoSrc=-53640.36876934566,
    nistCoeff={1.04253,0.00138528},
    residualModel=9);

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsR124(
    Tc=395.425,
    coeffs=[
      0.05175,        1.197]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsR124(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -5.532034162429256,        1.003;
      -4.742002285997961,        1.051;
      4.083301102214,        1.163;
      -0.8556260869752595,        2.188;
      -3.759805971191399,        4.015;
      -5.094637151194883,        19.693],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      9.076759200951095,        0.482;
      -17.685013904231155,        0.651;
      59.69226551115479,        0.881;
      -48.46415018361892,        0.914;
      0.6023234565910854,        5.001;
      -1.0939055527121821,        10.577],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -3.6411060779677857,        0.415;
      0.3822304251070335,        0.5;
      -19.603560148262865,        1.704;
      181.0410898999192,        2.307;
      -168.52216602298836,        2.394;
      -2.5180916684231893,        13.161])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: deVries-ICR-1995</p>
<p>Viscosity: Bell-PURDUE-2016-ETA and ECS</p>
<p>Conductivity: Huber-IECR-2003</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end R124;

within HelmholtzMedia.HelmholtzFluids;
package Helium "Helium"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="helium" "short name",
  final fluidConstants={fluidConstantsHelium},
  final helmholtzCoefficients=helmholtzCoefficientsHelium,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsHelium,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsHelium,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsHelium,
  final ancillaryCoefficients=ancillaryCoefficientsHelium,
  final fluidLimits=fluidLimitsHelium,
  Density(min=fluidLimitsHelium.DMIN, max=fluidLimitsHelium.DMAX, start=fluidConstantsHelium.molarMass/fluidConstantsHelium.criticalMolarVolume),
  Temperature(min=fluidLimitsHelium.TMIN, max=fluidLimitsHelium.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsHelium.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsHelium.HMIN, max=fluidLimitsHelium.HMAX, start=(fluidLimitsHelium.HMIN+fluidLimitsHelium.HMAX)/2),
  SpecificEntropy(min=fluidLimitsHelium.SMIN, max=fluidLimitsHelium.SMAX, start=(fluidLimitsHelium.SMIN+fluidLimitsHelium.SMAX)/2));

  final constant FluidConstants
  fluidConstantsHelium(
    casRegistryNumber="7440-59-7",
    molarMass=0.004002602,
    hasCriticalData=true,
       criticalTemperature=5.1953,
       criticalPressure=227600,
       criticalMolarVolume=5.752515287309376e-05,
       //HCRIT0=11233.05116310681,//CoolProp
       HCRIT0=14675.1,//EOS calculation
       //SCRIT0=2055.196929719407,//CoolProp
       SCRIT0=2656.02,//EOS calculation
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
       acentricFactor=-0.3836,
    triplePointTemperature=2.1768,
    triplePointPressure=5033.5488966581215,
    normalBoilingPoint=4.222,
    meltingPoint=2.1768) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsHelium(
    TMIN=fluidConstantsHelium.triplePointTemperature,
    TMAX=2000,
    DMIN=Modelica.Constants.small,
    //DMAX=565.25,//RefProp
    DMAX=541.542,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=1000000000,
    HMIN=0,
    HMAX=1.267e7,
    SMIN=-45020,
    SMAX=52180) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsHelium(
    idealLead={0.1871304489697973-0.0138019, 0.4848903984696551-0.0174403},
    idealLog=[
      1.5,         1.],
    idealNBPoffset={0.0, 0.0},
    residualPoly=[
      0.015559018,    1.0,    4;
      3.0638932,    0.425,    1;
      -4.2420844,    0.63,    1;
      0.054418088,    0.69,    2;
      -0.18971904,    1.83,    2;
      0.087856262,    0.575,    3],
    residualBwr=[
      2.2833566,    0.925,    1,    1;
      -0.53331595,    1.585,    1,    2;
      -0.53296502,    1.69,    3,    2;
      0.99444915,    1.51,    2,    1;
      -0.30078896,    2.9,    2,    2;
      -1.6432563,    0.8,    1,    1],
    residualGauss=[
      0.8029102,    1.26,    2,    2,    2,    -1.5497,    -0.2471,    3.15,    0.596;
      0.026838669,    3.51,    1,    2,    2,    -9.245,    -0.0983,    2.54505,    0.3423;
      0.04687678,    2.785,    2,    2,    2,    -4.76323,    -0.1556,    1.2513,    0.761;
      -0.14832766,    1.0,    1,    2,    2,    -6.3826,    -2.6782,    1.9416,    0.9747;
      0.03016211,    4.22,    1,    2,    2,    -8.7023,    -2.7077,    0.5984,    0.5868;
      -0.019986041,    0.83,    3,    2,    2,    -0.255,    -0.6621,    2.2282,    0.5627;
      0.14283514,    1.575,    2,    2,    2,    -0.3523,    -0.1775,    1.606,    2.5346;
      0.007418269,    3.447,    2,    2,    2,    -0.1492,    -0.4821,    3.815,    3.6763;
      -0.22989793,    0.73,    3,    2,    2,    -0.05,    -0.3069,    1.61958,    4.5245;
      0.79224829,    1.634,    2,    2,    2,    -0.1668,    -0.1758,    0.6407,    5.039;
      -0.049386338,    6.13,    2,    2,    2,    -42.2358,    -1357.6577,    1.076,    0.959])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsHelium(
    diluteModel=1,
    residualModel=1,
    criticalModel=0);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsHelium(
    diluteModel=0,
    initialModel=0,
    residualModel=1);
  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsHelium(
    Tc=5.1953,
    coeffs=[
      0.0004656,        1.04;
      0.001889,        2.468;
      -0.002006,        2.661]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsHelium(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -2.5589967099484343,        0.981;
      -2.1208869241528903,        1.13;
      2.0304814035943877,        1.536;
      0.9702906562630098,        3.109;
      -0.006217789170073319,        0.338;
      -4.338734244510393,        14.431],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      1.8225767219916278,        0.402;
      -0.5212838519553242,        0.491;
      0.2130685389843537,        0.941;
      -0.44861224586106435,        1.784;
      5.329845315529739,        8.213;
      -10.020970811883176,        9.042],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -0.8412289332631507,        0.211;
      -3.590072534944493,        0.693;
      2.2788760536554777,        0.749;
      -1.4459129841887175,        1.118;
      2.0638632716793297,        1.846;
      -14.547720153618606,        19.915])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: OrtizVega-JPCRD-2019</p>
<p>Viscosity: Arp-NIST-1998</p>
<p>Conductivity: Hands 1981/McCarty-1972</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end Helium;

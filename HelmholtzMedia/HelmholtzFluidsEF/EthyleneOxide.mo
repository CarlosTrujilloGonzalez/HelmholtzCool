within HelmholtzMedia.HelmholtzFluidsEF;
package EthyleneOxide "EthyleneOxide"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="ethyleneoxide" "short name",
  final fluidConstants={fluidConstantsEthyleneOxide},
  final helmholtzCoefficients=helmholtzCoefficientsEthyleneOxide,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsEthyleneOxide,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsEthyleneOxide,
  //final surfaceTensionCoefficients=surfaceTensionCoefficientsEthyleneOxide,
  final ancillaryCoefficients=ancillaryCoefficientsEthyleneOxide,
  final fluidLimits=fluidLimitsEthyleneOxide,
  final refSubstance=ReferenceSubstance.Propane,
  final referenceHelmholtzCoeff = Transport.ECSreferences.helmholtzCoefficientsPropane,
  referenceConstants =  Transport.ECSreferences.fluidConstantsPropane,
  referenceViscosityCoeff = Transport.ECSreferences.dynamicViscosityCoefficientsPropane,
  referenceConductivityCoeff = Transport.ECSreferences.thermalConductivityCoefficientsPropane,
  Density(min=fluidLimitsEthyleneOxide.DMIN, max=fluidLimitsEthyleneOxide.DMAX, start=fluidConstantsEthyleneOxide.molarMass/fluidConstantsEthyleneOxide.criticalMolarVolume),
  Temperature(min=fluidLimitsEthyleneOxide.TMIN, max=fluidLimitsEthyleneOxide.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsEthyleneOxide.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsEthyleneOxide.HMIN, max=fluidLimitsEthyleneOxide.HMAX, start=(fluidLimitsEthyleneOxide.HMIN+fluidLimitsEthyleneOxide.HMAX)/2),
  SpecificEntropy(min=fluidLimitsEthyleneOxide.SMIN, max=fluidLimitsEthyleneOxide.SMAX, start=(fluidLimitsEthyleneOxide.SMIN+fluidLimitsEthyleneOxide.SMAX)/2));

  final constant FluidConstants
  fluidConstantsEthyleneOxide(
    casRegistryNumber="75-21-8",
    molarMass=0.04405256,
    hasCriticalData=true,
       criticalTemperature=468.92,
       criticalPressure=7304686.159635853,
       criticalMolarVolume=0.0001394700139470014,
       HCRIT0=534048.4055413937,//CoolProp OK
       SCRIT0=1353.0196962954083,//CoolProp OK
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=1.89,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=false,
    hasAccurateConductivityData=false,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.21019548904995822,
    triplePointTemperature=160.65,
    triplePointPressure=8.251614065467786,
    normalBoilingPoint=283.6,
    meltingPoint=160.65) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsEthyleneOxide(
    TMIN=fluidConstantsEthyleneOxide.triplePointTemperature,
    TMAX=1000,
    DMIN=Modelica.Constants.small,
    DMAX=1216.14,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=1000000000.0,
    HMIN=-231854,
    HMAX=2.55526e6,
    SMIN=-1758.92,
    SMAX=30287.2) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsEthyleneOxide(
    idealLead={-3.90644775, 4.0000956},
    idealLog=[
      3.0,         1.],
    idealEinstein=[
      6.79,        -2.8363047001620743;
      4.53,        -4.627655037106543;
      3.68,        -9.532542864454491],
    idealIIRoffset={-5.69074, 2.49322},
    idealNBPoffset={0, 0},
    residualPoly=[
      0.0300676,    1.0,    4;
      2.1629,    0.41,    1;
      -2.72041,    0.79,    1;
      -0.53931,    1.06,    2;
      0.181051,    0.58,    3],
    residualBwr=[
      -2.61292,    2.0,    1,    2;
      -2.08004,    2.2,    3,    2;
      0.3169968,    0.73,    2,    1;
      -1.6532,    2.4,    2,    2;
      -0.01981719,    0.97,    7,    1],
    residualGauss=[
      3.34387,    1.87,    1,    2,    2,    -1.02,    -0.62,    0.847,    0.705;
      -0.950671,    2.08,    1,    2,    2,    -1.55,    -1.11,    0.34,    0.821;
      -0.445528,    2.8,    3,    2,    2,    -1.44,    -0.62,    0.265,    0.791;
      -0.005409938,    0.97,    3,    2,    2,    -14,    -368,    1.13,    1.08;
      -0.0638824,    3.15,    2,    2,    2,    -1.63,    -0.66,    0.36,    1.64;
      -0.093912,    0.7,    1,    2,    2,    -1.9,    -1.87,    1.05,    1.51])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsEthyleneOxide(
    ai={3.03522e-4,1.99873e-6},
    diluteModel=9,
    nistCoeff={0.9,-0.005},
    residualModel=9,
    qD=1976284585,
    zeta0=1.76e-10,
    Gamma=0.028,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsEthyleneOxide(
    epsilon=372.37,
    sigma=0.42,
    Fc=1.0,
    diluteModel=3,
    initialModel=0,
    nistCoeff={1.29794,-0.295066,0.0626748},
    residualModel=9);
  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsEthyleneOxide(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -7.002,        1.0;
      1.1835,        1.5;
      -2.196,        3.3;
      -1.394,        5.05;
      -1.582,        17.0;
      -382.3,        36.8],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      2.3014,        0.382;
      -0.08549,        0.93;
      2.055,        1.48;
      -2.883,        2.1;
      1.686,        2.95],
    densityVaporModel=DensityVaporModel.DV3,
    densityVapor=[
      -3.0498,        0.414;
      -7.1199,        1.276;
      -23.067,        3.63;
      -56.11,        7.84;
      -127.8,        16.9])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Thol-CES-2015,Thol-CES-2015-CORR,Thol-THESIS-2015</p>
</body>
  </html>"));
end EthyleneOxide;

within HelmholtzMedia.HelmholtzFluidsCD;
package DimethylCarbonate "DimethylCarbonate"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="dimethylcarbonate" "short name",
  final fluidConstants={fluidConstantsDimethylCarbonate},
  final helmholtzCoefficients=helmholtzCoefficientsDimethylCarbonate,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsDimethylCarbonate,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsDimethylCarbonate,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsDimethylCarbonate,
  final ancillaryCoefficients=ancillaryCoefficientsDimethylCarbonate,
  final fluidLimits=fluidLimitsDimethylCarbonate,
  final refSubstance=ReferenceSubstance.Propane,
  final referenceHelmholtzCoeff = Transport.ECSreferences.helmholtzCoefficientsPropane,
  referenceConstants =  Transport.ECSreferences.fluidConstantsPropane,
  referenceViscosityCoeff = Transport.ECSreferences.dynamicViscosityCoefficientsPropane,
  referenceConductivityCoeff = Transport.ECSreferences.thermalConductivityCoefficientsPropane,
  Density(min=fluidLimitsDimethylCarbonate.DMIN, max=fluidLimitsDimethylCarbonate.DMAX, start=fluidConstantsDimethylCarbonate.molarMass/fluidConstantsDimethylCarbonate.criticalMolarVolume),
  Temperature(min=fluidLimitsDimethylCarbonate.TMIN, max=fluidLimitsDimethylCarbonate.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsDimethylCarbonate.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsDimethylCarbonate.HMIN, max=fluidLimitsDimethylCarbonate.HMAX, start=(fluidLimitsDimethylCarbonate.HMIN+fluidLimitsDimethylCarbonate.HMAX)/2),
  SpecificEntropy(min=fluidLimitsDimethylCarbonate.SMIN, max=fluidLimitsDimethylCarbonate.SMAX, start=(fluidLimitsDimethylCarbonate.SMIN+fluidLimitsDimethylCarbonate.SMAX)/2));

  final constant FluidConstants
  fluidConstantsDimethylCarbonate(
    casRegistryNumber="616-38-6",
    molarMass=0.0900779,
    hasCriticalData=true,
       criticalTemperature=557,
       criticalPressure=4908800,
       criticalMolarVolume=0.00025,
       //HCRIT0=512933.20681636356,//CoolProp
       HCRIT0=512801,//EOS calculation
       //SCRIT0=1080.3705646678943,//CoolProp
       SCRIT0=1080.15,//EOS calculation
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
       acentricFactor=0.346,
    triplePointTemperature=277.06,
    triplePointPressure=2226.523727216828,
    normalBoilingPoint=363.112,
    meltingPoint=277.06) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsDimethylCarbonate(
    TMIN=fluidConstantsDimethylCarbonate.triplePointTemperature,
    TMAX=600,
    DMIN=Modelica.Constants.small,
    DMAX=1090.57,//RefProp
    //DMAX=1132.33,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=60000000,
    HMIN=-161432,
    HMAX=763081,
    SMIN=-506.1,
    SMAX=14651.8) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsDimethylCarbonate(
    idealLead={4.9916462, -0.1709449},
    idealLog=[
      8.28421,         1.],
    idealEinstein=[
      1.48525,        -0.03770197486535009;
      0.822585,        -2.405745062836625;
      16.2453,        -3.001795332136445;
      1.15925,        -13.27648114901257],
    idealIIRoffset={-16.6853, 7.07373},
    residualPoly=[
      0.00052683187,    1,    5;
      1.353396,    0.227,    1;
      -2.649283,    1.05,    1;
      -0.2785412,    1.06,    2;
      0.1742554,    0.5,    3;
      0.031606252,    0.78,    4],
    residualBwr=[
      0.399866,    1.3,    1,    1;
      1.178144,    1.347,    2,    1;
      -0.0235281,    0.706,    7,    1;
      -1.015,    2,    1,    2;
      -0.7880436,    2.5,    2,    2;
      -0.12696,    4.262,    3,    2],
    residualGauss=[
      1.2198,    1,    1,    2,    2,    -0.9667,    -1.24,    1.2827,    0.6734;
      -0.4883,    2.124,    1,    2,    2,    -1.5154,    -0.821,    0.4317,    0.9239;
      -0.0033293,    0.4,    2,    2,    2,    -1.0591,    -15.45,    1.1217,    0.8636;
      -0.0035387,    3.5,    2,    2,    2,    -1.6642,    -2.21,    1.1871,    1.0507;
      -0.51172,    0.5,    3,    2,    2,    -12.4856,    -437,    1.1243,    0.8482;
      -0.16882,    2.7,    3,    2,    2,    -0.9662,    -0.743,    0.4203,    0.7522])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsDimethylCarbonate(
    ai={0.00132},
    diluteModel=9,
    nistCoeff={1.1238,-0.0154353},
    residualModel=9,
    qD=1612903226,
    zeta0=2.04e-10,
    Gamma=0.059,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsDimethylCarbonate(
    epsilon=442.3,
    sigma=0.51,
    Fc=1.0,
    diluteModel=3,
    initialModel=0,
    nistCoeff={0.811428,0.0616704},
    residualModel=9);
  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsDimethylCarbonate(
    Tc=557.0,
    coeffs=[
      0.0825,        1.39]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsDimethylCarbonate(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -2.597007649585314,        0.945;
      -15.509376515573363,        1.114;
      12.767875905311987,        1.224;
      -1.7459847599351825,        2.157;
      -1.196780284722721,        2.469;
      -3.425253357555481,        4.522],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      0.8639422657944309,        0.221;
      -1.688248771620619,        0.307;
      3.3308155638028083,        0.394;
      152.44139464976624,        5.545;
      -173.70557844277656,        5.765;
      36624.29817631924,        19.705],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -1.8639798693880143,        0.318;
      -12.434353793968175,        0.882;
      9.656910477455611,        0.995;
      -8.552325635675663,        3.273;
      11.090574157797857,        5.755;
      -495.7580019137995,        13.354])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Zhou-JPCRD-2011</p>
<p>Surface tension: Mulero-JPCRD-2014</p>
</body>
  </html>"));
end DimethylCarbonate;

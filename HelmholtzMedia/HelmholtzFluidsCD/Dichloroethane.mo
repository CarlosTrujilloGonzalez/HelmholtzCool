within HelmholtzMedia.HelmholtzFluidsCD;
package Dichloroethane "Dichloroethane"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="dichloroethane" "short name",
  final fluidConstants={fluidConstantsDichloroethane},
  final helmholtzCoefficients=helmholtzCoefficientsDichloroethane,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsDichloroethane,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsDichloroethane,
  //final surfaceTensionCoefficients=surfaceTensionCoefficientsDichloroethane,
  final ancillaryCoefficients=ancillaryCoefficientsDichloroethane,
  final fluidLimits=fluidLimitsDichloroethane,
  final refSubstance=ReferenceSubstance.Propane,
  final referenceHelmholtzCoeff = Transport.ECSreferences.helmholtzCoefficientsPropane,
  final referenceConstants =  Transport.ECSreferences.fluidConstantsPropane,
  final referenceViscosityCoeff = Transport.ECSreferences.dynamicViscosityCoefficientsPropane,
  final referenceConductivityCoeff = Transport.ECSreferences.thermalConductivityCoefficientsPropane,
  Density(min=fluidLimitsDichloroethane.DMIN, max=fluidLimitsDichloroethane.DMAX, start=fluidConstantsDichloroethane.molarMass/fluidConstantsDichloroethane.criticalMolarVolume),
  Temperature(min=fluidLimitsDichloroethane.TMIN, max=fluidLimitsDichloroethane.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsDichloroethane.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsDichloroethane.HMIN, max=fluidLimitsDichloroethane.HMAX, start=(fluidLimitsDichloroethane.HMIN+fluidLimitsDichloroethane.HMAX)/2),
  SpecificEntropy(min=fluidLimitsDichloroethane.SMIN, max=fluidLimitsDichloroethane.SMAX, start=(fluidLimitsDichloroethane.SMIN+fluidLimitsDichloroethane.SMAX)/2));

  final constant FluidConstants
  fluidConstantsDichloroethane(
    casRegistryNumber="107-06-2",
    molarMass=0.098959,
    hasCriticalData=true,
       criticalTemperature=561.6,
       criticalPressure=5227585.103082351,
       criticalMolarVolume=0.00023094688221709007,
       HCRIT0=97744.01910501554,//CoolProp OK
       SCRIT0=26.54723700936421,//CoolProp OK
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=1.44,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=false,
    hasAccurateConductivityData=false,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.26857850087358104,
    triplePointTemperature=237.52,
    triplePointPressure=239.86831029711738,
    normalBoilingPoint=356.66,
    meltingPoint=237.52) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsDichloroethane(
    TMIN=fluidConstantsDichloroethane.triplePointTemperature,
    TMAX=1000,
    DMIN=Modelica.Constants.small,
    DMAX=1598.01,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=1000000000.0,
    HMIN=-433092,
    HMAX=1.25365e6,
    SMIN=-1672.83,
    SMAX=12948.9) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsDichloroethane(
    idealLead={25.029988, -4.8999527},
    idealLog=[
      3.0,         1.],
    idealEinstein=[
      5.35,        -0.04006410256410256;
      10.05,        -3.587962962962963],
    idealASHRAEoffset={-15.8058, 9.10662},
    idealIIRoffset={-25.1518, 12.4481},
    idealNBPoffset={-9.06618, 5.87281},
    residualPoly=[
      0.051,    1.0,    4;
      1.99,    0.352,    1;
      -2.595,    0.89,    1;
      -0.6653,    0.824,    2;
      0.23595,    0.498,    3],
    residualBwr=[
      -1.7,    1.63,    1,    2;
      -0.4453,    4.07,    3,    2;
      0.672474,    0.679,    2,    1;
      -0.21918,    2.85,    2,    2;
      -0.03554,    1.07,    7,    1],
    residualGauss=[
      0.9765,    1.7,    1,    2,    2,    -0.66,    -0.574,    0.995,    0.571;
      -0.495179,    2.09,    1,    2,    2,    -1.36,    -1.8,    0.329,    0.862;
      -0.23291174,    1.93,    3,    2,    2,    -0.711,    -0.462,    0.525,    0.597;
      -0.01090245,    3.72,    3,    2,    2,    -1.7,    -3.22,    0.85,    1.16;
      0.39209,    1.58,    1,    2,    2,    -1.11,    -2.22,    0.585,    0.208])
  "Coefficients of the Helmholtz EoS";
  
  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsDichloroethane(
    ai={9.18633e-4,7.08996e-7},
    diluteModel=9,
    nistCoeff={1.35752,-0.116398},
    residualModel=9,
    qD=1658374793,
    zeta0=2.04e-10,
    Gamma=0.056,
    criticalModel=2
  );

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsDichloroethane(
    epsilon=445.96,
    sigma=0.4963,
    Fc=0.96,
    diluteModel=3,
    initialModel=0,
    nistCoeff={0.766881,0.136995,-0.0161687},
    residualModel=9);
  
  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsDichloroethane(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      165.36698422586568,        21.333333333333332;
      0.0052916174810783275,        0.38549999999999995;
      -9.017819060173176,        1.0;
      2.980836234817244,        1.1666666666666667;
      -2.6554946105425685,        3.0;
      -1.6100143507300122,        5.333333333333333],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      -3486.7010459117164,        0.362;
      7662.134765207801,        0.3725;
      -20066.396425294417,        0.39449999999999996;
      15893.782467519954,        0.39799999999999996;
      -0.1522403185655092,        2.8333333333333335;
      7.705626172172473,        12.333333333333334],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      7.077091293578975,        0.131;
      -11.678392041088753,        0.16666666666666666;
      216.4369746131653,        0.39049999999999996;
      -216.32772112714244,        0.39649999999999996;
      -1.1167782517350253,        1.5;
      -4.408739606531312,        3.8333333333333335])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Thol-THESIS-2015</p>
</body>
  </html>"));
end Dichloroethane;

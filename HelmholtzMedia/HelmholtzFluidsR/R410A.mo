within HelmholtzMedia.HelmholtzFluidsR;
package R410A "R410A"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="r410a" "short name",
  final fluidConstants={fluidConstantsR410A},
  final helmholtzCoefficients=helmholtzCoefficientsR410A,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsR410A,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsR410A,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsR410A,
  final ancillaryCoefficients=ancillaryCoefficientsR410A,
  final fluidLimits=fluidLimitsR410A,
  final refSubstance=ReferenceSubstance.None,
  final referenceHelmholtzCoeff = helmholtzCoefficients,
  final referenceConstants =  fluidConstants[1],
  Density(min=fluidLimitsR410A.DMIN, max=fluidLimitsR410A.DMAX, start=fluidConstantsR410A.molarMass/fluidConstantsR410A.criticalMolarVolume),
  Temperature(min=fluidLimitsR410A.TMIN, max=fluidLimitsR410A.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsR410A.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsR410A.HMIN, max=fluidLimitsR410A.HMAX, start=(fluidLimitsR410A.HMIN+fluidLimitsR410A.HMAX)/2),
  SpecificEntropy(min=fluidLimitsR410A.SMIN, max=fluidLimitsR410A.SMAX, start=(fluidLimitsR410A.SMIN+fluidLimitsR410A.SMAX)/2));

  final constant FluidConstants
  fluidConstantsR410A(
    casRegistryNumber="R410A.PPF",
    molarMass=0.07258540000000001,
    hasCriticalData=true,
       criticalTemperature=344.494,
       criticalPressure=4901200,
       criticalMolarVolume=0.00015812776723592666,
       //HCRIT0=368754.59469383146,//CoolProp
       HCRIT0=368706,//EOS calculation
       //SCRIT0=1518.660401226994,//CoolProp
       SCRIT0=1518.54,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=0.0,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=true,
    hasAccurateConductivityData=true,
    hasVapourPressureCurve=false,
    hasAcentricFactor=true,
       acentricFactor=0.296,
    triplePointTemperature=200.0,
    triplePointPressure=29160.33537476026,
    normalBoilingPoint=221.71,
    meltingPoint=200.0) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsR410A(
    TMIN=fluidConstantsR410A.triplePointTemperature,
    TMAX=500,
    DMIN=Modelica.Constants.small,
    DMAX=1416.14,//RefProp
    //DMAX=1488.13,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=50000000,
    HMIN=96986,
    HMAX=1.0e6,//654575,
    SMIN=564.768,
    SMAX=18551.9) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsR410A(
    idealLead={36.8871, 7.15807},
    idealLog=[
      -1,         1.],
    idealPower=[
      -46.87575,      -0.1],
    idealEinstein=[
      2.0623,        -2.02326;
      5.9751,        -5.00154;
      1.5612,        -11.2484],
    idealASHRAEoffset={6.59888, -3.69104},
    idealIIRoffset={0.0, 0.0},
    residualPoly=[
      0.987252,    0.44,    1;
      -1.03017,    1.2,    1;
      1.17666,    2.97,    1;
      -0.138991,    2.95,    2;
      0.00302373,    0.2,    5],
    residualBwr=[
      -2.53639,    1.93,    1,    1;
      -1.9668,    1.78,    2,    1;
      -0.83048,    3,    3,    1;
      0.172477,    0.2,    5,    1;
      -0.261116,    0.74,    5,    1;
      -0.0745473,    3,    5,    1;
      0.679757,    2.1,    1,    2;
      -0.652431,    4.3,    1,    2;
      0.0553849,    0.25,    4,    2;
      -0.071097,    7,    4,    2;
      -0.000875332,    4.7,    9,    2;
      0.020076,    13,    2,    3;
      -0.0139761,    16,    2,    3;
      -0.018511,    25,    4,    3;
      0.0171939,    17,    5,    3;
      -0.00482049,    7.4,    6,    3])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsR410A(
    diluteTred=1,
    an=[
      -0.008872,        0;
      7.41e-05,        1],
    ad=[
      1.0,        0],
    diluteModel=2,
    residualTred=344.494,
    residualDred=459.0300696,
    b=[
      0.016414915288896,        0,        1,       0,       0;
      -0.0019058593303886919,        0,        2,       0,       0;
      0.00420061845936278,        0,        3,       0,       0;
      -0.0001644950202819914,        0,        4,       0,       0],
    residualModel=2,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsR410A(
    a=[
      -2.695e-06,        0;
      5.85e-08,        1;
      -2.129e-11,        2],
    diluteModel=4,
    sigma=9.999999999999999e+107,
    epsilon=1e+99,
    residualTred=344.4943434,
    residualDMred=6323.999999999999,
    dp=[
      4.1528450396712e-06,        1,        0,        0,        1;
      1.2187385701457372e-05,        2,        0,        0,        1;
      1.2660855545258757e-05,        3,        0,        0,        1;
      -1.0753223728015742e-05,        4,        0,        0,        1;
      1.9206178288211474e-06,        5,        0,        0,        1;
      3.6793471063956824e-07,        6,        0,        0,        1],
    bl=[
      0.0,        0,        0],
    b0n=[
      1,        0],
    b0d=[
      1,        0],
    residualModel=2);

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsR410A(
    Tc=344.56,
    coeffs=[
      0.06238,        1.246]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsR410A(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -7.2818,        1;
      2.5093,        1.8;
      -3.2695,        2.4;
      -2.8022,        4.9],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      17.62376356934577,        0.732;
      -34.49248423230781,        1.165;
      229.4790425881445,        2.775;
      -332.5139608181856,        3.462;
      23058076.978355706,        15.531;
      -31889422.797179773,        15.944],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -25.00709732482156,        0.676;
      34.83593078562833,        0.844;
      -33.0203056956001,        1.394;
      61.19129776625034,        2.411;
      -63.32155175461899,        3.149;
      149.8912653231937,        7.808])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Lemmon-IJT-2003</p>
<p>Viscosity: Geller-PURDUE-2000</p>
<p>Conductivity: Geller-IJT-2001</p>
<p>Surface tension: Okada-IJT-1999</p>
</body>
  </html>"));
end R410A;

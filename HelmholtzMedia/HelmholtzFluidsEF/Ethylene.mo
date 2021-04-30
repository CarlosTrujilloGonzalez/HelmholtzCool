within HelmholtzMedia.HelmholtzFluidsEF;
package Ethylene "Ethylene"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="ethylene" "short name",
  final fluidConstants={fluidConstantsEthylene},
  final helmholtzCoefficients=helmholtzCoefficientsEthylene,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsEthylene,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsEthylene,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsEthylene,
  final ancillaryCoefficients=ancillaryCoefficientsEthylene,
  final fluidLimits=fluidLimitsEthylene,
  final refSubstance=ReferenceSubstance.Propane,
  final referenceHelmholtzCoeff = HelmholtzFluidsPQ.Propane.helmholtzCoefficientsPropane,
  final referenceConstants =  HelmholtzFluidsPQ.Propane.fluidConstantsPropane,
  final referenceViscosityCoeff = HelmholtzFluidsPQ.Propane.dynamicViscosityCoefficientsPropane,
  final referenceConductivityCoeff = HelmholtzFluidsPQ.Propane.thermalConductivityCoefficientsPropane,
  Density(min=fluidLimitsEthylene.DMIN, max=fluidLimitsEthylene.DMAX, start=fluidConstantsEthylene.molarMass/fluidConstantsEthylene.criticalMolarVolume),
  Temperature(min=fluidLimitsEthylene.TMIN, max=fluidLimitsEthylene.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsEthylene.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsEthylene.HMIN, max=fluidLimitsEthylene.HMAX, start=(fluidLimitsEthylene.HMIN+fluidLimitsEthylene.HMAX)/2),
  SpecificEntropy(min=fluidLimitsEthylene.SMIN, max=fluidLimitsEthylene.SMAX, start=(fluidLimitsEthylene.SMIN+fluidLimitsEthylene.SMAX)/2));

  final constant FluidConstants
  fluidConstantsEthylene(
    casRegistryNumber="74-85-1",
    molarMass=0.02805376,
    hasCriticalData=true,
       criticalTemperature=282.35,
       criticalPressure=5041800,
       criticalMolarVolume=0.00013094548170276325,
       //HCRIT0=399511.4118555294,//CoolProp
       HCRIT0=399431,//EOS calculation
       //SCRIT0=1661.654805522841,//CoolProp
       SCRIT0=1661.42,//EOS calculation
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
       acentricFactor=0.0866,
    triplePointTemperature=103.989,
    triplePointPressure=122.02676384261189,
    normalBoilingPoint=169.379,
    meltingPoint=103.989) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsEthylene(
    TMIN=fluidConstantsEthylene.triplePointTemperature,
    TMAX=450,
    DMIN=Modelica.Constants.small,
    //DMAX=758.29,//RefProp
    DMAX=740,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=300000000,
    HMIN=-158088,
    HMAX=999274,
    SMIN=-1.7331e3,
    SMAX=45218.5) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsEthylene(
    idealLead={8.68815523-12.2225787966305, -4.47960564+7.89924916929716},
    idealLog=[
      3,         1.],
    idealEinstein=[
      2.49395851,        -4.43266896;
      3.0027152,        -5.74840149;
      2.5126584,        -7.8027825;
      3.99064217,        -15.5851154],
    idealIIRoffset={1.13017, -1.25545},
    idealNBPoffset={0, 0},
    residualPoly=[
      1.861742910067,    0.5,    1;
      -3.0913708460844,    1,    1;
      -0.17384817095516,    2.5,    1;
      0.08037098569284,    0,    2;
      0.23682707317354,    2,    2;
      0.021922786610247,    0.5,    4],
    residualBwr=[
      0.11827885813193,    1,    1,    1;
      -0.021736384396776,    4,    1,    1;
      0.044007990661139,    1.25,    3,    1;
      0.12554058863881,    2.75,    4,    1;
      -0.13167945577241,    2.25,    5,    1;
      -0.0052116984575897,    1,    7,    1;
      0.00015236081265419,    0.75,    10,    1;
      -2.4505335342756e-05,    0.5,    11,    1;
      0.28970524924022,    2.5,    1,    2;
      -0.18075836674288,    3.5,    1,    2;
      0.15057272878461,    4,    2,    2;
      -0.14093151754458,    6,    2,    2;
      0.022755109070253,    1.5,    4,    2;
      0.014026070529061,    5,    4,    2;
      0.0061697454296214,    4.5,    6,    2;
      -0.00041286083451333,    15,    7,    3;
      0.012885388714785,    20,    4,    4;
      -0.069128692157093,    23,    5,    4;
      0.10936225568483,    22,    6,    4;
      -0.0081818875271794,    29,    6,    4;
      -0.05641847211717,    19,    7,    4;
      0.0016517867750633,    15,    8,    4;
      0.0095904006517001,    13,    9,    4;
      -0.0026236572984886,    10,    10,    4],
    residualGauss=[
      -50.242414011355,    1,    2,    2,    2,    -25,    -325,    1.16,    1;
      7484.6420119299,    0,    2,    2,    2,    -25,    -300,    1.19,    1;
      -6873.4299232625,    1,    2,    2,    2,    -25,    -300,    1.19,    1;
      -935.77982814338,    2,    3,    2,    2,    -25,    -300,    1.19,    1;
      941.33024786113,    3,    3,    2,    2,    -25,    -300,    1.19,    1])
  "Coefficients of the Helmholtz EoS";
  
  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsEthylene(
    corrG=120,
    coefG={-1.2748E-02,5.155E-01,-3.7681E+03,0.0,0.0},
    diluteModel=10,
    corrL=51,
    coefL={-1.9499E-01,-1.1178E+01,-3.1182E-01,-3.4844E-03,3.5873E-07},
    residualModel=10,
    criticalModel=2);
  
  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsEthylene(
    a=[
      -3.5098225018e-1,        -1;
      2.5008406184e-1,        -2/3;
      -5.8365540744e-2,        -1/3;
      4.5549146583e-4,        0;
      2.2881683403e-3,        1/3;
      -4.7318682077e-4,       2/3;
      4.5022249258e-5,        1;
      -2.1490688088e-6,       4/3;
      4.1649263233e-8,       5/3],
    diluteModel=4,//from Holland
    initialModel=0,
    corrL=30,
    coefL={-8.9556,2.8821E+02,-2.1985E-01,-1.0831E-05,2.000E+00},
    residualModel=10
      
   /*coefL={
      -8.03553028329404,
      -439.8962514,
       8.69536237617,
       5773.08496161,
       0.267589139152,
       -34.3939162700000,
       66.4795135739,
       7.63299886259},
   residualModel=7*///VS2
      );
  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsEthylene(
    Tc=282.35,
    coeffs=[
      0.0477,        1.17]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsEthylene(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      30.782068035093094,        1.118;
      -1.467121970937139,        1.461;
      0.09230690543250192,        2.464;
      -2.5188888709008195,        4.298;
      -34.95537683446643,        1.082;
      6.643870978349449,        18.676],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      1.8464339723391994,        0.348;
      0.7268516869915771,        0.912;
      -1.717280185311927,        3.94;
      1686.1315441396878,        6.912;
      -3729.1628980234227,        7.065;
      2049.0293383014655,        7.198],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -0.21894352062047293,        0.165;
      -3.4266486595099503,        0.497;
      -1.5160021065230918,        1.478;
      -4.205648419382292,        5.546;
      -265.8806216433561,        19.239;
      474.2473840272181,        19.774])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Smukala-JPCRD-2000</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end Ethylene;

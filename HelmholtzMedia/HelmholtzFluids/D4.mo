within HelmholtzMedia.HelmholtzFluids;
package D4 "D4"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="d4" "short name",
  final fluidConstants={fluidConstantsD4},
  final helmholtzCoefficients=helmholtzCoefficientsD4,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsD4,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsD4,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsD4,
  final ancillaryCoefficients=ancillaryCoefficientsD4,
  final fluidLimits=fluidLimitsD4,
  Density(min=fluidLimitsD4.DMIN, max=fluidLimitsD4.DMAX, start=fluidConstantsD4.molarMass/fluidConstantsD4.criticalMolarVolume),
  Temperature(min=fluidLimitsD4.TMIN, max=fluidLimitsD4.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsD4.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsD4.HMIN, max=fluidLimitsD4.HMAX, start=(fluidLimitsD4.HMIN+fluidLimitsD4.HMAX)/2),
  SpecificEntropy(min=fluidLimitsD4.SMIN, max=fluidLimitsD4.SMAX, start=(fluidLimitsD4.SMIN+fluidLimitsD4.SMAX)/2));

  final constant FluidConstants
  fluidConstantsD4(
    casRegistryNumber="556-67-2",
    molarMass=0.29661576,
    hasCriticalData=true,
       criticalTemperature=586.5,
       criticalPressure=1347215.3560904593,
       criticalMolarVolume=0.0009587727708533077,
       //HCRIT0=324035.4413346994,//CoolProp
       HCRIT0=323594,//EOS calculation
       //SCRIT0=618.3989903609627,//CoolProp
       SCRIT0=617.646,//EOS calculation
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
       acentricFactor=0.5981248267987835,
    triplePointTemperature=290.25,
    triplePointPressure=73.06609963813099,
    normalBoilingPoint=448.504,
    meltingPoint=290.25) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsD4(
    TMIN=fluidConstantsD4.triplePointTemperature,
    TMAX=1200,
    DMIN=Modelica.Constants.small,
    //DMAX=952.13,//RefProp
    DMAX=1090.73,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=180000000.0,
    HMIN=-2.88e5,
    HMAX=1.93e6,
    SMIN=-923.4,
    SMAX=2634) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsD4(
    idealLead={71.1636049792958, -21.6743650975623},
    idealLog=[
      3,         1.],
    idealEinstein=[
      0.292757,        -0.06820119352088662;
      38.2456,        -0.3410059676044331;
      58.975,        -3.0690537084398977],
    idealIIRoffset={-68.059, 30.5047},
    idealNBPoffset={0, 0},
    residualPoly=[
      0.05273743,    1.0,    4;
      4.176401,    0.27,    1;
      -4.73707,    0.51,    1;
      -1.289588,    0.998,    2;
      0.5272749,    0.56,    3],
    residualBwr=[
      -2.558391,    1.75,    1,    2;
      -0.9726737,    3.09,    3,    2;
      0.7208209,    0.79,    2,    1;
      -0.4789456,    2.71,    2,    2;
      -0.05563239,    0.998,    7,    1],
    residualGauss=[
      3.766589,    0.93,    1,    2,    2,    -0.861,    -0.75,    1.124,    0.926;
      0.08786997,    3.17,    1,    2,    2,    -1.114,    -0.55,    1.388,    1.3;
      -0.1267646,    1.08,    3,    2,    2,    -1.01,    -1,    1.148,    1.114;
      -1.004246,    1.41,    2,    2,    2,    -1.11,    -0.47,    1.197,    0.996;
      -1.641887,    0.89,    2,    2,    2,    -1.032,    -1.36,    0.817,    0.483])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsD4(
    corrG=121,
    coefG={-4.2607E-04,8.6206E-06,7.1638E-08,-2.859E-11,0.0},
    diluteModel=10,
    corrL=50,
    coefL={1.68824E-01,1.61238E-04,-2.27454E-06,4.78035E-09,-3.37337E-12},
    residualModel=10,
    qD=1.017E+09,
    zeta0=2.98e-10,
    Gamma=0.064,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsD4(
    corrG=111,
    coefG={3.2808E-07,1.7531E-08,2.9278E-12,-2.2879E-15,0.0},
    diluteModel=10,
    corrL=30,
    coefL={-5.1302E+01,3.23237E+03,6.13082E+00,-6.67866E-06,2.000E+00},
    residualModel=10);

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsD4(
    Tc=586.5,
    coeffs=[
      0.04246,        1.207]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsD4(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      0.5345899746797975,        0.064;
      4.012049466701194,        0.367;
      -1.0289244610594683,        0.10600000000000001;
      -5.674842858271821,        0.5;
      -6.250797710936648,        1.1666666666666667;
      -8.407869194998023,        3.6666666666666665],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      1699.0113849179957,        0.089;
      -5407.311884597516,        0.093;
      3713.384933876656,        0.095;
      -140.88050502633448,        0.3575;
      138.43012562471498,        0.364;
      0.5512142245482865,        2.1666666666666665],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      0.24842573546167623,        0.060000000000000005;
      -0.29764756387215136,        0.079;
      -3.1891436123359056,        0.39849999999999997;
      -3.7005796634658807,        1.0;
      0.3110259942331251,        1.6666666666666667;
      -10.126305860017903,        3.5])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Thol-THESIS-2015</p>
<p>Liquid visc. and th.cond.: saturated correlations from ECS</p>
<p>Dilute visc. and th.cond.: Correlations from C.Yaws 2014</p>
<p>Surface tension: Mulero-JPCRD-2014</p>
</body>
  </html>"));
end D4;

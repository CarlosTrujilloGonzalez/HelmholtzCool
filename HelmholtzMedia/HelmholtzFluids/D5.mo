within HelmholtzMedia.HelmholtzFluids;
package D5 "D5"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="d5" "short name",
  final fluidConstants={fluidConstantsD5},
  final helmholtzCoefficients=helmholtzCoefficientsD5,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsD5,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsD5,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsD5,
  final ancillaryCoefficients=ancillaryCoefficientsD5,
  final fluidLimits=fluidLimitsD5,
  Density(min=fluidLimitsD5.DMIN, max=fluidLimitsD5.DMAX, start=fluidConstantsD5.molarMass/fluidConstantsD5.criticalMolarVolume),
  Temperature(min=fluidLimitsD5.TMIN, max=fluidLimitsD5.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsD5.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsD5.HMIN, max=fluidLimitsD5.HMAX, start=(fluidLimitsD5.HMIN+fluidLimitsD5.HMAX)/2),
  SpecificEntropy(min=fluidLimitsD5.SMIN, max=fluidLimitsD5.SMAX, start=(fluidLimitsD5.SMIN+fluidLimitsD5.SMAX)/2));

  final constant FluidConstants
  fluidConstantsD5(
    casRegistryNumber="541-02-6",
    molarMass=0.3707697,
    hasCriticalData=true,
       criticalTemperature=618.3,
       criticalPressure=1077687.7802565899,
       criticalMolarVolume=0.0012345679012345679,
       //HCRIT0=307081.228870031,//CoolProp
       HCRIT0=307324,//EOS calculation
       //SCRIT0=551.8871278161231,//CoolProp
       SCRIT0=552.28,//EOS calculation
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
       acentricFactor=0.6309446376541072,
    triplePointTemperature=226.0,
    triplePointPressure=0.0020593212230361497,
    normalBoilingPoint=484.05,
    meltingPoint=226.0) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsD5(
    TMIN=fluidConstantsD5.triplePointTemperature,
    TMAX=630,
    DMIN=Modelica.Constants.small,
    //DMAX=1049.28,//RefProp
    DMAX=1106.95,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=120000000,
    HMIN=-464502,
    HMAX=384982,
    SMIN=-1455e3,
    SMAX=700) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsD5(
    idealLead={94.38924286309562, -31.110222240232282},
    idealLog=[
      3,         1.],
    idealEinstein=[
      51.0,        -0.3574316674753356;
      57.9,        -2.802846514636908;
      35.0,        -7.349183244379751],
    idealIIRoffset={-90.7685, 42.1844},
    idealNBPoffset={0, 0},
    residualPoly=[
      0.0177345,    1.0,    4;
      4.3133088,    0.43,    1;
      -6.1586863,    0.754,    1;
      -1.4503945,    0.84,    2;
      0.9519342,    0.72,    3],
    residualBwr=[
      -2.3848036,    2.35,    1,    2;
      -1.4114529,    2.58,    3,    2;
      0.7255071,    0.66,    2,    1;
      -2.9966803,    1.71,    2,    2;
      -0.0902228,    1.0163,    7,    1],
    residualGauss=[
      6.3033323,    1.114,    1,    2,    2,    -1.046,    -0.37,    1.626,    0.787;
      -1.0592923,    1.85,    3,    2,    2,    -0.993,    -0.11,    1.05,    0.567;
      0.79365281,    0.9,    2,    2,    2,    -0.545,    -0.1,    1.11,    0.685;
      -1.8982515,    1.05,    2,    2,    2,    -1.128,    -0.37,    1.22,    0.577;
      -0.01351964,    1.09,    1,    2,    2,    -13.9,    -519.0,    1.083,    0.936])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsD5(
    corrG=121,
    coefG={-1.165E-03,1.0888E-05,6.1306E-08,-2.3667E-11,0.0},
    diluteModel=10,
    corrL=50,
    coefL={1.1848E-01,6.98429E-04,-4.43517E-06,8.66691E-09,-5.92252E-12},
    residualModel=10,
    qD=9.363E+08,
    zeta0=3.19e-10,
    Gamma=0.064,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsD5(
    corrG=111,
    coefG={3.5393E-07,1.5662E-08,3.3957E-12,-2.323E-15,0.0},
    diluteModel=10,
    corrL=30,
    coefL={-1.31061E+02,6.71078E+03,1.83614E+01,-1.82961E-05,2.000E+00},
    residualModel=10  );

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsD5(
    Tc=619.15,
    coeffs=[
      0.04408,        1.357]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsD5(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -9.256,        1.0;
      3.987,        1.5;
      -11.02,        2.24;
      -19.286,        3.48;
      16.524,        2.86;
      -8.14,        11.6],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      1.0938,        0.25;
      5.254,        0.79;
      -12.31,        1.33;
      19.364,        1.9;
      -15.81,        2.52;
      5.983,        3.22],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -0.916,        0.23;
      -5.911,        0.68;
      -18.617,        2.24;
      -74.29,        5.1;
      -154.4,        10.7;
      -284.1,        18.9])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Thol-FPE-2019-siloxanes</p>
<p>Liquid visc. and th.cond.: saturated correlations from ECS</p>
<p>Dilute visc. and th.cond.: Correlations from C.Yaws 2014</p>
<p>Surface tension: Mulero-JPCRD-2014</p>
</body>
  </html>"));
end D5;

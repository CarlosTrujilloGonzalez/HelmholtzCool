within HelmholtzMedia.HelmholtzFluids;
package CycloPropane "CycloPropane"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="cyclopropane" "short name",
  final fluidConstants={fluidConstantsCycloPropane},
  final helmholtzCoefficients=helmholtzCoefficientsCycloPropane,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsCycloPropane,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsCycloPropane,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsCycloPropane,
  final ancillaryCoefficients=ancillaryCoefficientsCycloPropane,
  final fluidLimits=fluidLimitsCycloPropane,
  Density(min=fluidLimitsCycloPropane.DMIN, max=fluidLimitsCycloPropane.DMAX, start=fluidConstantsCycloPropane.molarMass/fluidConstantsCycloPropane.criticalMolarVolume),
  Temperature(min=fluidLimitsCycloPropane.TMIN, max=fluidLimitsCycloPropane.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsCycloPropane.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsCycloPropane.HMIN, max=fluidLimitsCycloPropane.HMAX, start=(fluidLimitsCycloPropane.HMIN+fluidLimitsCycloPropane.HMAX)/2),
  SpecificEntropy(min=fluidLimitsCycloPropane.SMIN, max=fluidLimitsCycloPropane.SMAX, start=(fluidLimitsCycloPropane.SMIN+fluidLimitsCycloPropane.SMAX)/2));

  final constant FluidConstants
  fluidConstantsCycloPropane(
    casRegistryNumber="75-19-4",
    molarMass=0.042081,
    hasCriticalData=true,
       criticalTemperature=398.3,
       criticalPressure=5579700,
       criticalMolarVolume=0.0001627891670776686,
       //HCRIT0=615434.3961757988,//CoolProp
       HCRIT0=187516,//EOS calculation
       //SCRIT0=2173.2786988685098,//CoolProp
       SCRIT0=6073.54,//EOS calculation
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
       acentricFactor=0.1305495663687517,
    triplePointTemperature=145.7,
    triplePointPressure=342702.20373564865,
    normalBoilingPoint=241.67,
    meltingPoint=273.0) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsCycloPropane(
    TMIN=273,
    TMAX=473,
    DMIN=Modelica.Constants.small,
    //DMAX=656.25,//RefProp
    DMAX=693.3,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=28000000,
    HMIN=-2.1e5,
    HMAX=335167,
    SMIN=4887,
    SMAX=9136) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsCycloPropane(
    idealLead={0, 0},
    idealLog=[
      -1,         1.],
    Tc=398.3,
    T0=298.15,
    idealCpPolyT=[
      -0.04582023302189515,        1;
      0.0002558503477107775,        2;
      -3.908517142596848e-07,        3;
      2.051746651955177e-10,        4],
    idealIIRoffset={20.0665, 5.11125},
    idealCpConst=6.378038040672545,
    residualPoly=[
      -1.15634007067133,    0,    1;
      2.52574627508968,    1,    1;
      -2.82266128097357,    2,    1;
      0.283576801605235,    3,    1;
      -0.0842720496332253,    4,    1;
      0.931088565988454,    0,    2;
      -1.0529683988751,    1,    2;
      0.432021581602768,    2,    2;
      -0.251108864340636,    0,    3;
      0.127725892482498,    1,    3;
      0.0483622335785703,    0,    4;
      -0.0116474078333994,    1,    4;
      0.00033400656553506,    1,    5;
      -1.37016097592368,    3,    0;
      2.12444673007915,    4,    0;
      -0.578908942731662,    5,    0],
    residualBwr=[
      0.304945770506538,    3,    2,    2;
      -0.184276165170077,    4,    2,    2;
      -0.292111460404481,    5,    2,    2;
      1.37016097592368,    3,    0,    2;
      -2.12444673007915,    4,    0,    2;
      0.578908942731662,    5,    0,    2])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsCycloPropane(
    corrG=120,
    coefG={-9.1383E+01,8.9718E-01,-2.8331E+08,0.0,0.0},
    diluteModel=10,
    corrL=50,
    coefL={1.35986,-1.4189E-02,6.46561E-05,-1.37377E-07,1.09903E-10},
    residualModel=10,
    criticalModel=0);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsCycloPropane(
    corrG=110,
    coefG={1.7578E-06,4.265E-01,3.7034E+02,0.0,0.0},
    diluteModel=10,
    initialModel=0,
    corrL=30,
    coefL={-1.15201E+02,3.6126E+03,1.71909E+01,-4.29963E-05,2.0},
    residualModel=10  );

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsCycloPropane(
    Tc=398.3,
    coeffs=[
      0.06812,        1.314]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsCycloPropane(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -0.11955219361137283,        0.135;
      0.18406121015183027,        0.181;
      -0.13653132075738866,        0.421;
      -5.797505519116896,        0.983;
      -20.62240936494475,        6.3;
      -324540.4065607637,        16.644],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      0.36728670919821876,        0.109;
      17.39312205196081,        0.951;
      -65.70893634663562,        1.509;
      917.3256648476147,        2.43;
      -909.8353253919709,        2.535;
      1550.3280904976405,        7.779],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -0.33841331698570076,        0.098;
      -4.9703350919635545,        0.654;
      5.62081036731097,        2.255;
      -352.4354033337558,        5.732;
      14193580833.179937,        18.195;
      -19206776520.109684,        18.473])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Polt-CT-1992</p>
<p>Surface tension: Mulero-JPCRD-2014</p>
</body>
  </html>"));
end CycloPropane;

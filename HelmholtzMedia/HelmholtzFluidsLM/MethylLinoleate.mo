within HelmholtzMedia.HelmholtzFluidsLM;
package MethylLinoleate "MethylLinoleate"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="methyllinoleate" "short name",
  final fluidConstants={fluidConstantsMethylLinoleate},
  final helmholtzCoefficients=helmholtzCoefficientsMethylLinoleate,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsMethylLinoleate,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsMethylLinoleate,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsMethylLinoleate,
  final ancillaryCoefficients=ancillaryCoefficientsMethylLinoleate,
  final fluidLimits=fluidLimitsMethylLinoleate,
  final refSubstance=ReferenceSubstance.Propane,
  final referenceHelmholtzCoeff = Transport.ECSreferences.helmholtzCoefficientsPropane,
  referenceConstants =  Transport.ECSreferences.fluidConstantsPropane,
  referenceViscosityCoeff = Transport.ECSreferences.dynamicViscosityCoefficientsPropane,
  referenceConductivityCoeff = Transport.ECSreferences.thermalConductivityCoefficientsPropane,
  Density(min=fluidLimitsMethylLinoleate.DMIN, max=fluidLimitsMethylLinoleate.DMAX, start=fluidConstantsMethylLinoleate.molarMass/fluidConstantsMethylLinoleate.criticalMolarVolume),
  Temperature(min=fluidLimitsMethylLinoleate.TMIN, max=fluidLimitsMethylLinoleate.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsMethylLinoleate.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsMethylLinoleate.HMIN, max=fluidLimitsMethylLinoleate.HMAX, start=(fluidLimitsMethylLinoleate.HMIN+fluidLimitsMethylLinoleate.HMAX)/2),
  SpecificEntropy(min=fluidLimitsMethylLinoleate.SMIN, max=fluidLimitsMethylLinoleate.SMAX, start=(fluidLimitsMethylLinoleate.SMIN+fluidLimitsMethylLinoleate.SMAX)/2));

  final constant FluidConstants
  fluidConstantsMethylLinoleate(
    casRegistryNumber="112-63-0",
    molarMass=0.29447206,
    hasCriticalData=true,
       criticalTemperature=799,
       criticalPressure=1341000,
       criticalMolarVolume=0.0012370113805047008,
       //HCRIT0=581972.8499518138,//CoolProp
       HCRIT0=1.33514e6,//Eos calculation
       //SCRIT0=807.0169516005019,//CoolProp
       SCRIT0=38397.9,//EOS calculation
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
       acentricFactor=0.8054063870556485,
    triplePointTemperature=260.0,
    triplePointPressure=1.3112507347084836e-06,
    normalBoilingPoint=628.84,
    meltingPoint=260.0) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsMethylLinoleate(
    TMIN=fluidConstantsMethylLinoleate.triplePointTemperature,
    TMAX=1000,
    DMIN=Modelica.Constants.small,
    DMAX=930.53,//RefProp
    //DMAX=933.467,//Eos calculation
    PMIN=Modelica.Constants.small,
    PMAX=50000000,
    HMIN=-169080,
    HMAX=2.0478e6,
    SMIN=35382,
    SMAX=43199) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsMethylLinoleate(
    idealLead={-1, 0},
    idealLog=[
      -1,         1.],
    Tc=799,
    T0=298,
    idealCpPolyT=[
      22.97031008102499,        0.020213],
    idealEinstein=[
      52.60358084073167,        -3.81991239048811;
      34.54482738049993,        -0.9344568210262828;
      38.72236264672008,        -2.032953692115144],
    //idealNBPoffset={56.2531140679551, -23.9733038177064},//CoolProp
    residualPoly=[
      0.03183187,    1,    4;
      1.927286,    0.2,    1;
      -3.685053,    1.2,    1;
      0.08449312,    1,    3],
    residualBwr=[
      -0.9766643,    2.2,    1,    2;
      -0.4323178,    2.5,    3,    2;
      2.00047,    1.8,    2,    1;
      -1.75203,    1.92,    2,    2;
      -0.01726895,    1.47,    7,    1],
    residualGauss=[
      2.116515,    1.7,    1,    2,    2,    -1.1,    -0.9,    1.14,    0.79;
      -0.7884271,    2.3,    1,    2,    2,    -1.6,    -0.65,    0.65,    0.9;
      -0.3811699,    2.1,    3,    2,    2,    -1.1,    -0.75,    0.77,    0.76])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsMethylLinoleate(
    diluteTred=799.0,
    an=[
    -0.000109042,   0.0;
    0.00240543,     1.0;
    0.0407364,      2.0;
    -0.0105928,      3.0
    ],
    ad=[1,0],
    diluteModel=2,
    residualTred=799.0,
    residualDred=238.05,
    b=[
    -71.3126,98.9415,0.0,0.0,0.0;
    46.6421,-65.7850,0.0,0.0,0.0;
    -5.57406,12.8922,0.0,0.0,0.0],
    residualModel=4,
    qD=1142857142,
    zeta0=1.94e-10,
    Gamma=0.0496,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsMethylLinoleate(
    epsilon=634.48,
    sigma=0.8684,
    Fc=1.0,
    diluteModel=3,
    initialModel=0,
    nistCoeff={1.49489,-0.25538,0.0306593},
    residualModel=9);
  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsMethylLinoleate(
    Tc=799.0,
    coeffs=[
      0.072487,        1.9014]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsMethylLinoleate(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -11.729759799987315,        1.011;
      5.322853500770345,        1.432;
      -3.812792691428419,        2.308;
      -5.15160188466974,        3.026;
      -6.055964294506463,        4.993;
      -15.97775168800555,        11.346],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      -0.0228594977906372,        0.184;
      42.06993524981283,        0.675;
      -74.81792414596138,        0.837;
      55.25382502520959,        1.161;
      -21.334266315162196,        1.603;
      3.1025069538411154,        3.506],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -7.912131975217505,        0.546;
      2.6748252367096508,        0.747;
      -2.3670343724631104,        1.49;
      -6.595246957741222,        2.948;
      -9.264633405839822,        5.104;
      -78.68814362793601,        18.424])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Huber-EF-2009</p>
<p>Viscosity: ECS from NIST IR 8209</p>
<p>Thermal conductivity: Perkins-Huber 2011</p>
<p>Surface tension: Mulero-JPCRD-2014</p>
</body>
  </html>"));
end MethylLinoleate;

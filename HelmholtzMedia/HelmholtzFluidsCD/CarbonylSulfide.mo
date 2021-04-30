within HelmholtzMedia.HelmholtzFluidsCD;
package CarbonylSulfide "CarbonylSulfide"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="carbonylsulfide" "short name",
  final fluidConstants={fluidConstantsCarbonylSulfide},
  final helmholtzCoefficients=helmholtzCoefficientsCarbonylSulfide,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsCarbonylSulfide,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsCarbonylSulfide,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsCarbonylSulfide,
  final ancillaryCoefficients=ancillaryCoefficientsCarbonylSulfide,
  final fluidLimits=fluidLimitsCarbonylSulfide,
  final refSubstance=ReferenceSubstance.Propane,
  final referenceHelmholtzCoeff = HelmholtzFluidsPQ.Propane.helmholtzCoefficientsPropane,
  final referenceConstants =  HelmholtzFluidsPQ.Propane.fluidConstantsPropane,
  final referenceViscosityCoeff = HelmholtzFluidsPQ.Propane.dynamicViscosityCoefficientsPropane,
  final referenceConductivityCoeff = HelmholtzFluidsPQ.Propane.thermalConductivityCoefficientsPropane,
  Density(min=fluidLimitsCarbonylSulfide.DMIN, max=fluidLimitsCarbonylSulfide.DMAX, start=fluidConstantsCarbonylSulfide.molarMass/fluidConstantsCarbonylSulfide.criticalMolarVolume),
  Temperature(min=fluidLimitsCarbonylSulfide.TMIN, max=fluidLimitsCarbonylSulfide.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsCarbonylSulfide.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsCarbonylSulfide.HMIN, max=fluidLimitsCarbonylSulfide.HMAX, start=(fluidLimitsCarbonylSulfide.HMIN+fluidLimitsCarbonylSulfide.HMAX)/2),
  SpecificEntropy(min=fluidLimitsCarbonylSulfide.SMIN, max=fluidLimitsCarbonylSulfide.SMAX, start=(fluidLimitsCarbonylSulfide.SMIN+fluidLimitsCarbonylSulfide.SMAX)/2));

  final constant FluidConstants
  fluidConstantsCarbonylSulfide(
    casRegistryNumber="463-58-1",
    molarMass=0.0600751,
    hasCriticalData=true,
       criticalTemperature=378.77,
       criticalPressure=6370000,
       criticalMolarVolume=0.0001349527665317139,
       //HCRIT0=268011.5079625051,//CoolProp
       HCRIT0=267976,//EOS calculation
       //SCRIT0=841.0415985863306,//CoolProp
       SCRIT0=840.972,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=0.7152,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=false,
    hasAccurateConductivityData=false,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.0978,
    triplePointTemperature=134.3,
    triplePointPressure=64.43457800823276,
    normalBoilingPoint=222.99,
    meltingPoint=134.3) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsCarbonylSulfide(
    TMIN=fluidConstantsCarbonylSulfide.triplePointTemperature,
    TMAX=650,
    DMIN=Modelica.Constants.small,
    DMAX=1352.89,//RefProp
    //DMAX=1384.5,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=50000000,
    HMIN=-1.1e5,
    HMAX=640756,
    SMIN=-600.25,
    SMAX=21332.1) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsCarbonylSulfide(
    idealLead={-3.6587449805, 3.7349245016},
    idealLog=[
      2.5,         1.],
    idealEinstein=[
      2.1651,        -2.027615703461204;
      0.93456,        -3.59848984872086;
      1.0623,        -8.382395649074637;
      0.34269,        -33.87015867148929],
    idealIIRoffset={-5.44468, 2.6421},
    idealNBPoffset={0, 0},
    residualPoly=[
      0.94374,    0.25,    1;
      -2.5348,    1.125,    1;
      0.59058,    1.5,    1;
      -0.021488,    1.375,    2;
      0.082083,    0.25,    3;
      0.00024689,    0.875,    7],
    residualBwr=[
      0.21226,    0.625,    2,    1;
      -0.041251,    1.75,    5,    1;
      -0.22333,    3.625,    1,    2;
      -0.050828,    3.625,    4,    2;
      -0.028333,    14.5,    3,    3;
      0.016983,    12,    4,    3])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsCarbonylSulfide(
    ai={0.00125},
    corrG=120,
    coefG={1.2701E-03,6.0437E-01,5.4523E+02,3.6276E+03,0.0},
    diluteModel=9,
    nistCoeff={0.95},
    corrL=50,
    coefL={3.19318E-01,-1.91101E-03,9.14069E-06,-2.64324E-08,2.88867E-11},
    residualModel=9,
    qD=2.0E+09,
    zeta0=1.82e-10,
    Gamma=0.056,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsCarbonylSulfide(
    epsilon=335,
    sigma=0.413,
    corrG=110,
    coefG={1.0184E-05,2.938E-01,1.0127E+03,-1.225E+04,0.0},
    diluteModel=3,
    initialModel=0,
    nistCoeff={1.0},
    corrL=30,
    coefL={-2.4602E+01,8.34893E+02,2.48564,-1.19217E-05,2.000E+00},
    residualModel=9);

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsCarbonylSulfide(
    Tc=378.77,
    coeffs=[
      0.07246,        1.407]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsCarbonylSulfide(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -5.898980404479669,        0.98;
      1.4411942572733878,        1.966;
      -46.792325277477346,        3.287;
      56.09470221996165,        3.429;
      -13.259873589238543,        4.051;
      -0.851491340049802,        18.959],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      -0.006565517887508687,        0.187;
      9.861398057771247,        0.539;
      -49.28678353119856,        0.811;
      50.765489904412995,        0.921;
      -18.836456981431365,        1.495;
      10.180262280869785,        1.774],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      1.776086114558269,        0.376;
      -28.20299757513764,        0.531;
      43.7268964289033,        0.641;
      -22.918757269308017,        0.783;
      2.3656558943753296,        2.208;
      -4.806350485891986,        3.625])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Lemmon-JCED-2006</p>
<p>Viscosity and thermal conductivity: ECS plus correlations</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end CarbonylSulfide;

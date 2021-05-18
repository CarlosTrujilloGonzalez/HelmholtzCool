within HelmholtzMedia.HelmholtzFluidsNO;
package Octane_n "Octane_n"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="n-octane" "short name",
  final fluidConstants={fluidConstantsOctane_n},
  final helmholtzCoefficients=helmholtzCoefficientsOctane_n,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsOctane_n,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsOctane_n,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsOctane_n,
  final ancillaryCoefficients=ancillaryCoefficientsOctane_n,
  final fluidLimits=fluidLimitsOctane_n,
  final refSubstance=ReferenceSubstance.None,
  final referenceHelmholtzCoeff = helmholtzCoefficients,
  final referenceConstants =  fluidConstants[1],
  Density(min=fluidLimitsOctane_n.DMIN, max=fluidLimitsOctane_n.DMAX, start=fluidConstantsOctane_n.molarMass/fluidConstantsOctane_n.criticalMolarVolume),
  Temperature(min=fluidLimitsOctane_n.TMIN, max=fluidLimitsOctane_n.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsOctane_n.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsOctane_n.HMIN, max=fluidLimitsOctane_n.HMAX, start=(fluidLimitsOctane_n.HMIN+fluidLimitsOctane_n.HMAX)/2),
  SpecificEntropy(min=fluidLimitsOctane_n.SMIN, max=fluidLimitsOctane_n.SMAX, start=(fluidLimitsOctane_n.SMIN+fluidLimitsOctane_n.SMAX)/2));

  final constant FluidConstants
  fluidConstantsOctane_n(
    casRegistryNumber="111-65-9",
    molarMass=0.1142285,
    hasCriticalData=true,
       criticalTemperature=569.32,
       criticalPressure=2497000,
       criticalMolarVolume=0.0004862867146469558,
       //HCRIT0=575690.4674258154,//CoolProp
       HCRIT0=4.86225e6,//EOS calculation
       //SCRIT0=1167.4444327159983,//CoolProp
       SCRIT0=4122.11,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=0.07,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=true,
    hasAccurateConductivityData=true,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.395,
    triplePointTemperature=216.37,
    triplePointPressure=1.9889161260597106,
    normalBoilingPoint=398.77,
    meltingPoint=216.37) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsOctane_n(
    TMIN=fluidConstantsOctane_n.triplePointTemperature,
    TMAX=600,
    DMIN=Modelica.Constants.small,
    DMAX=764.19,//RefProp
    //DMAX=805.694,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=96000000,
    HMIN=3.87015e6,
    HMAX=5.0977e6,
    SMIN=1577.96,
    SMAX=14851.3) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsOctane_n(
    idealLead={-1.601873998562896, 0},
    idealLog=[
      3,         1.],
    idealSinh=[15.6865,158.922/569.32;48.1731,1693.07/569.32],
    idealCosh=[33.8029,815.064/569.32],
    //idealNBPoffset={17.1871525209699, -1.39902544739164},//CoolProp
    idealIIRoffset={14.5716, -91.4017},
    idealNBPoffset={40.5966, -103.445},
    //idealCpConst=4,
    residualPoly=[
      1.0722545,    0.25,    1;
      -2.4632951,    1.125,    1;
      0.65386674,    1.5,    1;
      -0.36324974,    1.375,    2;
      0.1271327,    0.25,    3;
      0.00030713573,    0.875,    7],
    residualBwr=[
      0.52656857,    0.625,    2,    1;
      0.019362863,    1.75,    5,    1;
      -0.58939427,    3.625,    1,    2;
      -0.14069964,    3.625,    4,    2;
      -0.0078966331,    14.5,    3,    3;
      0.0033036598,    12,    4,    3])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsOctane_n(
    diluteTred=569.32,
    an=[
      0.0077293,        0;
      -0.037114,        1;
      0.097758,        2;
      -0.028871,        3],
    ad=[
      1.0,        0],
    diluteModel=2,
    residualTred=569.32,
    residualDred=234.9,
    b=[
      0.0285553,        0,        1,       0,       0;
      -0.0171398,        0,        2,       0,       0;
      0.00659971,        0,        3,       0,       0;
      0,        0,        4,       0,       0;
      -0.00926155,        -1,        1,       0,       0;
      0,        -1,        2,       0,       0;
      0.00153496,        -1,        3,       0,       0;
      0,        -1,        4,       0,       0],
    residualModel=2,
    Rd=1.03,
    qD=1457130000.0,
    zeta0=1.94e-10,
    Gamma=0.0496,
    gamma=1.239,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsOctane_n(
    diluteLead=2.1357e-08,
    a=[
      0.335103,        0;
      -0.467898,        1],
    diluteModel=2,
    sigma=0.63617,
    epsilon=452.09,
    b=[
      -19.572881,        0,        0;
      219.73999,        -0.25,        0;
      -1015.3226,        -0.5,        0;
      2471.01251,        -0.75,        0;
      -3375.1717,        -1.0,        0;
      2491.6597,        -1.25,        0;
      -787.26086,        -1.5,        0;
      14.085455,        -2.5,        0;
      -0.34664158,        -5.5,        0],
    initialModel=2,
    residualTred=569.32,
    residualDMred=2056.4,
    dp=[
      -0.000103924,        2,        1,        0,        1;
      9.92302e-05,        2,        2,        0,        1;
      1.13327e-05,        3,        1,        0,        1;
      -3.22455e-05,        3,        2,        0,        1],
    bl=[
      0.000606122,        1,        0],
    b0n=[
      2.0651,        0;
      3.07843,        -0.5;
      -0.879088,        -1],
    b0d=[
      1,        0],
    residualModel=2);

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsOctane_n(
    Tc=569.32,
    coeffs=[
      0.34338,        1.6607;
      -0.50634,        1.9632;
      0.2238,        2.3547]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsOctane_n(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      0.2719726132924461,        0.633;
      -0.48708059237933493,        0.795;
      -6.67956803636084,        0.961;
      -3.319035552509312,        3.059;
      8.82048901491816,        4.43;
      -11.290630744556589,        4.557],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      1.8711197605157706,        0.385;
      6.362866515681488,        0.997;
      -7.771183246226491,        1.308;
      12.226059321950915,        3.718;
      -20.5321471354057,        5.702;
      269.9131977143042,        15.156],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -0.28818593722704483,        0.083;
      7.16566368663188,        0.387;
      -12.089045783083211,        0.453;
      -6.9190060351908285,        3.255;
      31.47207439558071,        11.847;
      -833.7529582567691,        19.244])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Span-IJT-2003B</p>
<p>Viscosity: Huber-FPE-2004</p>
<p>Conductivity: Huber-FPE-2005</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end Octane_n;

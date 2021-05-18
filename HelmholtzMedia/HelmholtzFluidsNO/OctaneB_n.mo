within HelmholtzMedia.HelmholtzFluidsNO;
package OctaneB_n "OctaneB_n"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="n-octane" "short name",
  final fluidConstants={fluidConstantsOctaneB_n},
  final helmholtzCoefficients=helmholtzCoefficientsOctaneB_n,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsOctaneB_n,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsOctaneB_n,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsOctaneB_n,
  final ancillaryCoefficients=ancillaryCoefficientsOctaneB_n,
  final fluidLimits=fluidLimitsOctaneB_n,
  final refSubstance=ReferenceSubstance.None,
  final referenceHelmholtzCoeff = helmholtzCoefficients,
  final referenceConstants =  fluidConstants[1],
  Density(min=fluidLimitsOctaneB_n.DMIN, max=fluidLimitsOctaneB_n.DMAX, start=fluidConstantsOctaneB_n.molarMass/fluidConstantsOctaneB_n.criticalMolarVolume),
  Temperature(min=fluidLimitsOctaneB_n.TMIN, max=fluidLimitsOctaneB_n.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsOctaneB_n.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsOctaneB_n.HMIN, max=fluidLimitsOctaneB_n.HMAX, start=(fluidLimitsOctaneB_n.HMIN+fluidLimitsOctaneB_n.HMAX)/2),
  SpecificEntropy(min=fluidLimitsOctaneB_n.SMIN, max=fluidLimitsOctaneB_n.SMAX, start=(fluidLimitsOctaneB_n.SMIN+fluidLimitsOctaneB_n.SMAX)/2));

  final constant FluidConstants
  fluidConstantsOctaneB_n(
    casRegistryNumber="111-65-9",
    molarMass=0.114229,
    hasCriticalData=true,
       criticalTemperature=568.74,
       criticalPressure=2483591.199677694,
       criticalMolarVolume=0.0004923682914820286,
       HCRIT0=574802.0052484552,//CoolProp OK
       SCRIT0=1165.8233494992623,//CoolProp OK
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
       acentricFactor=0.39752829818330415,
    triplePointTemperature=216.37,
    triplePointPressure=2.0745859950296133,
    normalBoilingPoint=398.77,
    meltingPoint=216.37) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsOctaneB_n(
    TMIN=fluidConstantsOctaneB_n.triplePointTemperature,
    TMAX=730,
    DMIN=Modelica.Constants.small,
    //DMAX=764.19,//RefProp for Span 2003 EOS
    DMAX=960,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=1000000000.0,
    HMIN=-416072,
    HMAX=2.0605e6,
    SMIN=-1982.69,
    SMAX=12478.8) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsOctaneB_n(
    idealLead={16.93282558002394, -4.06060393716559},
    idealLog=[
      3,         1.],
    idealEinstein=[
      17.47,        -0.6681436157119246;
      33.25,        -3.031262088124626;
      15.63,        -6.8238562436262615],
    idealIIRoffset={-26.0282, 12.0575},
    idealNBPoffset={0.0, 0.0},
    residualPoly=[
      0.042240369,    1.0,    4;
      1.4800888,    0.243,    1;
      -2.0975357,    0.856,    1;
      -0.72303256,    1.07,    2;
      0.26084383,    0.52,    3],
    residualBwr=[
      -1.6713762,    2.3,    1,    2;
      -1.3023632,    2.55,    3,    2;
      0.67710461,    1.075,    2,    1;
      -1.1644509,    2.24,    2,    2;
      -0.030939987,    0.951,    7,    1],
    residualGauss=[
      3.1437871,    0.59,    1,    2,    2,    -0.985,    -1.52,    1.448,    0.989;
      -0.011637891,    0.917,    1,    2,    2,    -13.6,    -998.0,    1.08,    0.986;
      -0.95649696,    1.05,    3,    2,    2,    -1.03,    -1.57,    1.185,    0.532;
      -0.36897912,    1.634,    2,    2,    2,    -1.084,    -1.44,    1.3,    1.16])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsOctaneB_n(
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
  dynamicViscosityCoefficientsOctaneB_n(
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
  surfaceTensionCoefficientsOctaneB_n(
    Tc=569.32,
    coeffs=[
      0.34338,        1.6607;
      -0.50634,        1.9632;
      0.2238,        2.3547]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsOctaneB_n(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -8.09474,        1.0;
      2.6247,        1.5;
      -2.3855,        1.9;
      -4.42236,        3.95;
      -2.8186,        15.5],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      2.2946,        0.358;
      2.6596,        1.568;
      -8.4135,        2.3;
      14.251,        3.0;
      -11.59,        3.815;
      4.0217,        4.78],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -3.18016,        0.394;
      -7.70809,        1.249;
      -24.2673,        3.32;
      -59.814,        6.715;
      -138.757,        14.2;
      -487.182,        31.1])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2021</b></p>
<p>EOS: Beckmueller-IJT-2019-octane</p>
<p>Viscosity: Huber-FPE-2004</p>
<p>Conductivity: Huber-FPE-2005</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end OctaneB_n;

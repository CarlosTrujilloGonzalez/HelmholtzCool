within HelmholtzMedia.HelmholtzFluidsCD;
package CycloHexane "CycloHexane"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="cyclohexane" "short name",
  final fluidConstants={fluidConstantsCycloHexane},
  final helmholtzCoefficients=helmholtzCoefficientsCycloHexane,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsCycloHexane,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsCycloHexane,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsCycloHexane,
  final ancillaryCoefficients=ancillaryCoefficientsCycloHexane,
  final fluidLimits=fluidLimitsCycloHexane,
  final refSubstance=ReferenceSubstance.Propane,
  final referenceHelmholtzCoeff = HelmholtzFluidsPQ.Propane.helmholtzCoefficientsPropane,
  final referenceConstants =  HelmholtzFluidsPQ.Propane.fluidConstantsPropane,
  final referenceViscosityCoeff = HelmholtzFluidsPQ.Propane.dynamicViscosityCoefficientsPropane,
  final referenceConductivityCoeff = HelmholtzFluidsPQ.Propane.thermalConductivityCoefficientsPropane,
  Density(min=fluidLimitsCycloHexane.DMIN, max=fluidLimitsCycloHexane.DMAX, start=fluidConstantsCycloHexane.molarMass/fluidConstantsCycloHexane.criticalMolarVolume),
  Temperature(min=fluidLimitsCycloHexane.TMIN, max=fluidLimitsCycloHexane.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsCycloHexane.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsCycloHexane.HMIN, max=fluidLimitsCycloHexane.HMAX, start=(fluidLimitsCycloHexane.HMIN+fluidLimitsCycloHexane.HMAX)/2),
  SpecificEntropy(min=fluidLimitsCycloHexane.SMIN, max=fluidLimitsCycloHexane.SMAX, start=(fluidLimitsCycloHexane.SMIN+fluidLimitsCycloHexane.SMAX)/2));

  final constant FluidConstants
  fluidConstantsCycloHexane(
    casRegistryNumber="110-82-7",
    molarMass=0.08415948000000001,
    hasCriticalData=true,
       criticalTemperature=553.6,
       criticalPressure=4082400,
       criticalMolarVolume=0.00031017369727047146,
       //HCRIT0=602030.6420813316,//CoolProp
       HCRIT0=601882,//EOS calculation
       //SCRIT0=1288.7709202023204,//CoolProp
       SCRIT0=1288.52,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=0.3,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=true,
    hasAccurateConductivityData=false,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.20926,
    triplePointTemperature=279.47,
    triplePointPressure=5240.204376932312,
    normalBoilingPoint=353.886,
    meltingPoint=279.47) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsCycloHexane(
    TMIN=fluidConstantsCycloHexane.triplePointTemperature,
    TMAX=700,
    DMIN=Modelica.Constants.small,
    //DMAX=822.25,//RefProp for Penoncello 1995 EOS
    DMAX=896,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=250000000,
    HMIN=-1.46e6,
    HMAX=1.17409e6,
    SMIN=-690,
    SMAX=16247.8) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsCycloHexane(
    idealLead={0.9891140602, 1.6359660572},
    idealLog=[
      3,         1.],
    idealEinstein=[
      0.83775,        -1.396315028901734;
      16.036,        -1.69978323699422;
      24.636,        -3.946893063583815;
      7.1715,        -8.11958092485549],
    idealIIRoffset={-15.3002, 6.35984},
    idealNBPoffset={0, 0},
    residualPoly=[
      0.05483581,    1,    4;
      1.607734,    0.37,    1;
      -2.375928,    0.79,    1;
      -0.5137709,    1.075,    2;
      0.1858417,    0.37,    3],
    residualBwr=[
      -0.9007515,    2.4,    1,    2;
      -0.5628776,    2.5,    3,    2;
      0.2903717,    0.5,    2,    1;
      -0.3279141,    3,    2,    2;
      -0.03177644,    1.06,    7,    1],
    residualGauss=[
      0.8668676,    1.6,    1,    2,    2,    -0.99,    -0.38,    0.65,    0.73;
      -0.1962725,    0.37,    1,    2,    2,    -1.43,    -4.2,    0.63,    0.75;
      -0.1425992,    1.33,    3,    2,    2,    -0.97,    -1.2,    1.14,    0.48;
      0.004197016,    2.5,    3,    2,    2,    -1.93,    -0.9,    0.09,    2.32;
      0.1776584,    0.9,    2,    2,    2,    -0.92,    -1.2,    0.56,    0.2;
      -0.04433903,    0.5,    2,    2,    2,    -1.27,    -2.6,    0.4,    1.33;
      -0.03861246,    0.73,    3,    2,    2,    -0.87,    -5.3,    1.01,    0.68;
      0.07399692,    0.2,    2,    2,    2,    -0.82,    -4.4,    0.45,    1.11;
      0.02036006,    1.5,    3,    2,    2,    -1.4,    -4.2,    0.85,    1.47;
      0.00272825,    1.5,    2,    2,    2,    -3,    -25,    0.86,    0.99])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsCycloHexane(
  diluteTred=553.6,
    an=[
      6.52149E-3,        0;
      -39.8399E-3,        1;
      65.3275E-3,        2;
      -202.857E-3,        3;
      78.7909E-3,        4],
    ad=[
      -2.3043,        0;
      1.83274,        1;
      -2.66787,        2;
      1.0,        3],
    diluteModel=2,//coefficients from JPCRD Vol14 num.1 2017
    //corrG=120,
    //coefG={8.5865E-07,1.771,2.4316E+02,-9.1779,0.0},
    //diluteModel=10,
    residualTred=553.6,
    residualDred=271.33,
    b=[
      1.89732E01,        2.14942,        1,       0,       0;
      -6.27889E01,        3.15482E01,        2,       0,       0;
      1.00748E02,        -6.29082E01,        3,       0,       0;
      -4.77988E01,        3.22047E01,        4,       0,       0;
      7.32262,        -4.87801,        5,       0,       0],
    residualModel=4,
    //corrL=51,
    //coefL={7.3881E-02,-3.015E+02,3.0119E-01,-6.8406E-03,-2.8646E-06},
    //residualModel=10,
    Rd=1.02,
    qD=1497005988,
    zeta0=2.3e-10,
    Gamma=0.058,
    gamma=1.239,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsCycloHexane(
    diluteModel=1,
    initialTred=1,
    initialDMred=1,
    b=[
      5.09643e-09,        1,        0;
      -3.38721e-06,        1,        1;
      0.000337477,        1,        2],
    initialModel=3,
    residualTred=553.6,
    residualDMred=3224.0,
    dp=[
      0.0,        2.2,        0,        0,        1;
      0.000335234,        2.2,        1,        0,        1;
      7.8494803e-06,        2.5,        0,        0,        1;
      -0.0006873976,        2.5,        1,        0,        1;
      0.0,        2.8,        0,        0,        1;
      0.0003620868,        2.8,        1,        0,        1;
      -1.04793856e-05,        10,        0,        0,        1;
      2.5521774e-06,        10,        1,        0,        1;
      1.72734993e-05,        11,        0,        0,        1;
      -5.9372242e-06,        11,        1,        0,        1;
      -1.06186149e-05,        12,        0,        0,        1;
      4.3982781e-06,        12,        1,        0,        1;
      2.8894928e-06,        13,        0,        0,        1;
      -1.3468174e-06,        13,        1,        0,        1;
      -2.938491e-07,        14,        0,        0,        1;
      1.487134e-07,        14,        1,        0,        1],
    bl=[
      0,        0,        0],
    b0n=[
      1,        0],
    b0d=[
      1,        0],
    residualModel=2  );

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsCycloHexane(
    Tc=553.64,
    coeffs=[
      0.06485,        1.263]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsCycloHexane(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -0.001507316116386758,        0.031;
      0.0019454414399892835,        0.087;
      -6.247176974611268,        0.976;
      0.47954202162953397,        2.262;
      -3.680367872644098,        3.53;
      -5.145901784236558,        9.757],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      0.2729676351917065,        0.165;
      -1.106482113619369,        0.243;
      27.748806842659924,        0.498;
      -34.01756141062687,        0.564;
      9.815362300266182,        0.717;
      65.7039717441813,        12.621],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      7.91278554789447,        0.395;
      -14.912016731516744,        0.432;
      5.351652597227101,        0.604;
      -3.875832207589477,        0.994;
      -6.953692859831638,        4.823;
      3685.8600260352014,        18.36])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Zhou-JPCRD-2014</p>
<p>Conductivity: Koutian-JPCRD-2017-Cyclohexane</p>
<p>Viscosity: Tariq-JPCRD-2014-Cyclohexane</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end CycloHexane;

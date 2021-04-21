within HelmholtzMedia.HelmholtzFluids;
package Pentane "Pentane"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="pentane" "short name",
  final fluidConstants={fluidConstantsPentane},
  final helmholtzCoefficients=helmholtzCoefficientsPentane,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsPentane,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsPentane,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsPentane,
  final ancillaryCoefficients=ancillaryCoefficientsPentane,
  final fluidLimits=fluidLimitsPentane,
  Density(min=fluidLimitsPentane.DMIN, max=fluidLimitsPentane.DMAX, start=fluidConstantsPentane.molarMass/fluidConstantsPentane.criticalMolarVolume),
  Temperature(min=fluidLimitsPentane.TMIN, max=fluidLimitsPentane.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsPentane.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsPentane.HMIN, max=fluidLimitsPentane.HMAX, start=(fluidLimitsPentane.HMIN+fluidLimitsPentane.HMAX)/2),
  SpecificEntropy(min=fluidLimitsPentane.SMIN, max=fluidLimitsPentane.SMAX, start=(fluidLimitsPentane.SMIN+fluidLimitsPentane.SMAX)/2));

  final constant FluidConstants
  fluidConstantsPentane(
    casRegistryNumber="109-66-0",
    molarMass=0.07214878,
    hasCriticalData=true,
       criticalTemperature=469.7,
       criticalPressure=3367518.990389116,
       criticalMolarVolume=0.00031152647975077883,
       //HCRIT0=516823.994472069,//CoolProp
       HCRIT0=520446,//EOS calculation
       //SCRIT0=2276.3699714473246,//CoolProp
       SCRIT0=1296.06,//EOS calculation
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
       acentricFactor=0.2510319126804281,
    triplePointTemperature=143.47,
    triplePointPressure=0.07802807327356376,
    normalBoilingPoint=309.21,
    meltingPoint=143.47) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsPentane(
    TMIN=fluidConstantsPentane.triplePointTemperature,
    TMAX=650,
    DMIN=Modelica.Constants.small,
    //DMAX=808.1,//RefProp
    DMAX=916.9,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=780000000.0,
    HMIN=-347000,
    HMAX=1.82e6,
    SMIN=-2286,
    SMAX=3710) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsPentane(
    idealLead={8.509252832282648, 0.06430584062033375},
    idealLog=[
      3,         1.],
    idealEinstein=[
      6.618,        -0.3278688524590164;
      15.97,        -2.8188205237385566;
      15.29,        -5.607834788162657],
    idealASHRAEoffset={-5.39, 3.10396},
    idealIIRoffset={-11.1342, 5.21928},
    idealNBPoffset={0, 0},
    residualPoly=[
      0.042952795,    1.0,    4;
      2.4923999,    0.367,    1;
      -2.603872,    0.704,    1;
      -0.83829913,    1.04,    2;
      0.19223378,    0.494,    3],
    residualBwr=[
      -3.0778196,    1.34,    1,    2;
      -0.000324816,    0.688,    1,    3;
      -1.6781976,    1.688,    3,    2;
      0.6416425,    0.88,    2,    1;
      -1.7300934,    1.357,    2,    2;
      -0.017585046,    1.021,    7,    1],
    residualGauss=[
      4.5708883,    0.979,    1,    2,    2,    -1.01,    -0.583,    1.06,    0.927;
      -0.0758188,    2.966,    1,    2,    2,    -4.77,    -31.6,    1.37,    0.968;
      -0.62122633,    1.35,    3,    2,    2,    -1.13,    -0.52,    1.09,    0.735;
      -0.42413043,    0.664,    2,    2,    2,    -1.08,    -0.654,    1.19,    1.196;
      -2.0418443,    0.937,    2,    2,    2,    -1.12,    -0.75,    0.83,    0.617])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsPentane(
    diluteTred=469.7,
    an=[
      -0.00396685,        0;
      0.0353805,        1;
      0.00511554,        2;
      -0.108585,        3;
      0.179573,        4;
      0.0392128,        5],
    ad=[
      2.71636,        0;
      -5.76265,        1;
      6.77885,        2;
      -0.59135,        3;
      1,        4],
    diluteModel=2,
    residualTred=469.7,
    residualDred=232.0,
    b=[
      0.000776054,        0,        1,       0,       0;
      0.00797696,        -1,        1,       0,       0;
      0.117655,        0,        2,       0,       0;
      -0.0785888,        -1,        2,       0,       0;
      -0.133101,        0,        3,       0,       0;
      0.0916089,        -1,        3,       0,       0;
      0.0534026,        0,        4,       0,       0;
      -0.0370431,        -1,        4,       0,       0;
      -0.0068793,        0,        5,       0,       0;
      0.0050962,        -1,        5,       0,       0],
    residualModel=2,
    Rd=1.02,
    qD=1497005988.0239522,
    zeta0=2.27e-10,
    Gamma=0.058,
    gamma=1.239,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsPentane(
    diluteTred=469.7,
    a=[
      1.76805e-05,        0;
      -5.56942e-05,        0.25;
      4.87177e-05,        0.5;
      0.0,        0.75],
    diluteModel=5,
    sigma=0.5784,
    epsilon=341.1,
    residualTred=469.7,
    bl=[
      1.08193e-08,        -4.71699e-08,        0;
      1.21502e-07,        -9.84766e-08,        0.0;
      -5.08307e-08,        -1.07e-08,        0.0;
      -2.10025e-13,        -1.56583e-12,        0.0;
      1.98521e-11,        2.05972e-12,        0.0;
      -1.18487e-10,        1.69571e-10,        0.0],
    residualModel=3);

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsPentane(
    Tc=469.7,
    coeffs=[
      0.08015,        1.408;
      0.004384,        1.031;
      -0.03437,        1.818]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsPentane(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -7.3342,        1.0;
      2.043,        1.5;
      -2.196,        2.26;
      -6.3246,        5.5;
      5.429,        7.1;
      -2.821,        11.0],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      3.5771,        0.43;
      -4.653,        0.83;
      8.517,        1.25;
      -7.831,        1.72;
      3.3029,        2.24;
      0.5782,        17.5],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -3.5333,        0.428;
      -8.4246,        1.484;
      -25.474,        3.87;
      -57.24,        7.86;
      -34.6,        15.98;
      -111.9,        17.33])
  "Coefficients for the ancillary equations";
  
  /*final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsPentane(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
     -0.73918E+01,   1.0;
      0.31102E+01,   1.5;
     -0.22415E+01,   1.74;
     -0.31585E+01,   3.75;
     -0.90451E+00,   8.0],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      0.10178E+01,   0.27;
      0.42703E+00,   0.44;
      0.11334E+01,   0.6;
      0.41518E+00,   4.0;
     -0.47950E-01,   5.0],
    densityVaporModel=DensityVaporModel.DV3,
    densityVapor=[
     -0.29389E+01,   0.4;
     -0.62784E+01,   1.18;
     -0.19941E+02,   3.2;
     -0.16709E+02,   6.6;
     -0.36543E+02,   7.0;
     -0.12799E+03,  15.0],
    pressureMeltingModel=PressureMeltingModel.ML1,
    T_reducing=143.47,
    p_reducing=0.076322,
    pressureMelting1=[
      -8647500000.0, 0;
       8647500001.0, 1.649],
    pressureMelting2=fill(0.0, 0, 2),
    pressureMelting3=fill(0.0, 0, 2))
  "Coefficients for the ancillary equations (PS5, DL1, DV3, ML1)";*/
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Thol-FPE-2019-alkanes-pentane</p>
<p>Viscosity: QuiñonesCisneros-JPCB-2006</p>
<p>Conductivity: Vassiliou-JPCRD-2015-pentanes</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
<p>Ancillary equations have been taken from HelmholtzMedia, due to convergence problems with the CoolProp ones. Necessary to investigate the reason.</p>
</body>
  </html>"));
end Pentane;

within HelmholtzMedia.HelmholtzFluidsGH;
package Hydrogen "Hydrogen"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="hydrogen" "short name",
  final fluidConstants={fluidConstantsHydrogen},
  final helmholtzCoefficients=helmholtzCoefficientsHydrogen,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsHydrogen,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsHydrogen,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsHydrogen,
  final ancillaryCoefficients=ancillaryCoefficientsHydrogen,
  final fluidLimits=fluidLimitsHydrogen,
  final refSubstance=ReferenceSubstance.Nitrogen,
  final referenceHelmholtzCoeff = HelmholtzFluidsNO.Nitrogen.helmholtzCoefficientsNitrogen,
  final referenceConstants =  HelmholtzFluidsNO.Nitrogen.fluidConstantsNitrogen,
  final referenceViscosityCoeff = HelmholtzFluidsNO.Nitrogen.dynamicViscosityCoefficientsNitrogen,
  final referenceConductivityCoeff = HelmholtzFluidsNO.Nitrogen.thermalConductivityCoefficientsNitrogen,
  Density(min=fluidLimitsHydrogen.DMIN, max=fluidLimitsHydrogen.DMAX, start=fluidConstantsHydrogen.molarMass/fluidConstantsHydrogen.criticalMolarVolume),
  Temperature(min=fluidLimitsHydrogen.TMIN, max=fluidLimitsHydrogen.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsHydrogen.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsHydrogen.HMIN, max=fluidLimitsHydrogen.HMAX, start=(fluidLimitsHydrogen.HMIN+fluidLimitsHydrogen.HMAX)/2),
  SpecificEntropy(min=fluidLimitsHydrogen.SMIN, max=fluidLimitsHydrogen.SMAX, start=(fluidLimitsHydrogen.SMIN+fluidLimitsHydrogen.SMAX)/2));

  final constant FluidConstants
  fluidConstantsHydrogen(
    casRegistryNumber="1333-74-0",
    molarMass=0.00201588,
    hasCriticalData=true,
       criticalTemperature=33.145,
       criticalPressure=1296400.0,
       criticalMolarVolume=6.448284756254837e-05,
       //HCRIT0=298160.88073734706,//CoolProp
       HCRIT0=298160,//EoS calculation
       //SCRIT0=9644.224385023232,//CoolProp
       SCRIT0=9644.21,//EoS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=0.0,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=true,
    hasAccurateConductivityData=true,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=-0.219,
    triplePointTemperature=13.957,
    triplePointPressure=7357.828141607672,
    normalBoilingPoint=20.38,
    meltingPoint=13.957) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsHydrogen(
    TMIN=fluidConstantsHydrogen.triplePointTemperature,
    TMAX=1000,
    DMIN=Modelica.Constants.small,
    //DMAX=205.632,//RefProp
    DMAX=183.405,//EOS calculation
    //DMAX=150,//better for convergence at high pressure and not very low temperature
    PMIN=Modelica.Constants.small,
    PMAX=2000000000,
    HMIN=-53924.8,
    HMAX=2.71886e7,
    SMIN=-5756,//EOS calculation
    SMAX=625542) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsHydrogen(
    idealLead={-1.4579856475, 1.888076782},
    idealLog=[
      1.5,         1.],
    idealEinstein=[
      1.616,        -16.0205159149;
      -0.4117,        -22.6580178006;
      -0.792,        -60.0090511389;
      0.758,        -74.9434303817;
      1.217,        -206.9392065168],
    idealIIRoffset={6.19115, -26.5939},
    idealNBPoffset={0, 0},
    residualPoly=[
      -6.93643,    0.6844,    1;
      0.01,    1,    4;
      2.1101,    0.989,    1;
      4.52059,    0.489,    1;
      0.732564,    0.803,    2;
      -1.34086,    1.1444,    2;
      0.130985,    1.409,    3],
    residualBwr=[
      -0.777414,    1.754,    1,    1;
      0.351944,    1.311,    3,    1],
    residualGauss=[
      -0.0211716,    4.187,    2,    2,    2,    -1.685,    -0.171,    0.7164,    1.506;
      0.0226312,    5.646,    1,    2,    2,    -0.489,    -0.2245,    1.3444,    0.156;
      0.032187,    0.791,    3,    2,    2,    -0.103,    -0.1304,    1.4517,    1.736;
      -0.0231752,    7.249,    1,    2,    2,    -2.506,    -0.2785,    0.7204,    0.67;
      0.0557346,    2.986,    1,    2,    2,    -1.607,    -0.3967,    1.5445,    1.662])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsHydrogen(
    diluteTred=33.145,
    an=[
      -0.340976,        0;
      4.5882,        1;
      -1.4508,        2;
      0.326394,        3;
      0.00316939,        4;
      0.000190592,        5;
      -1.139e-06,        6],
    ad=[
      138.497,        0;
      -22.1878,        1;
      4.57151,        2;
      1.0,        3],
    diluteModel=2,
    residualTred=33.145,
    residualDred=31.262,
    b=[
      0.0363081,        0,        1,       0,       0;
      0.0018337,        -1,        1,       0,       0;
      -0.0207629,        0,        2,       0,       0;
      -0.00886716,        -1,        2,       0,       0;
      0.031481,        0,        3,       0,       0;
      0.015826,        -1,        3,       0,       0;
      -0.0143097,        0,        4,       0,       0;
      -0.0106283,        -1,        4,       0,       0;
      0.0017498,        0,        5,       0,       0;
      0.00280673,        -1,        5,       0,       0],
    residualModel=2,
    Rd=1.01,
    qD=2500000000.0,
    zeta0=1.5e-10,
    Gamma=0.052,
    gamma=1.2415,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsHydrogen(
    sigma=0.297,
    epsilon=30.41,
    diluteLead=2.1357e-08,
    a=[
      0.20963,        0;
      -0.455274,        1;
      0.143602,        2;
      -0.0335325,        3;
      0.00276981,        4],
    diluteModel=2,
    b=[
      -0.187,        0,        0;
      2.4871,        -1,        0;
      3.7151,        -2,        0;
      -11.0972,        -3,        0;
      9.0965,        -4,        0;
      -3.8292,        -5,        0;
      0.5166,        -6,        0],
    initialModel=2,
    residualModel=1
  );

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsHydrogen(
    Tc=33.145,
    coeffs=[
      -1.4165,        0.63882;
      0.746383,        0.659804;
      0.675625,        0.619149]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsHydrogen(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -0.5553870929135406,        0.882;
      -7.0852972599030295,        1.072;
      0.006868538454095541,        1.355;
      0.8295514415153659,        2.61;
      -0.08773773693832483,        8.191;
      3.754274235303921,        1.239],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      1.9546584452513824,        0.407;
      -5.715534926385584,        3.401;
      714.2366728890577,        7.095;
      -1666.5447521212081,        8.095;
      2698.8598951804593,        10.911;
      -12755.576112629806,        17.353],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -3.036644018774332,        0.473;
      -773.9211864728516,        6.618;
      1530.809493601263,        7.083;
      -3087.995404817007,        9.094;
      3472.491545729249,        10.577;
      -15649.585518005188,        19.579])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Leachman-JPCRD-2009</p>
<p>Viscosity: Muzny-JCED-2013</p>
<p>Conductivity: Assael-JPCRD-2011-Hydrogen</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
<p>The convergence problems at pressure higher than 300 bars can be solved by lowering the DMAX constant to 150 kg/m3</p>
</body>
  </html>"));
end Hydrogen;

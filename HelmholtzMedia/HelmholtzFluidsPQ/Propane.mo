within HelmholtzMedia.HelmholtzFluidsPQ;
package Propane "Propane"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="propane" "short name",
  final fluidConstants={fluidConstantsPropane},
  final helmholtzCoefficients=helmholtzCoefficientsPropane,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsPropane,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsPropane,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsPropane,
  final ancillaryCoefficients=ancillaryCoefficientsPropane,
  final fluidLimits=fluidLimitsPropane,
  final refSubstance=ReferenceSubstance.None,
  final referenceHelmholtzCoeff = helmholtzCoefficients,
  final referenceConstants =  fluidConstants[1],
  Density(min=fluidLimitsPropane.DMIN, max=fluidLimitsPropane.DMAX, start=fluidConstantsPropane.molarMass/fluidConstantsPropane.criticalMolarVolume),
  Temperature(min=fluidLimitsPropane.TMIN, max=fluidLimitsPropane.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsPropane.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsPropane.HMIN, max=fluidLimitsPropane.HMAX, start=(fluidLimitsPropane.HMIN+fluidLimitsPropane.HMAX)/2),
  SpecificEntropy(min=fluidLimitsPropane.SMIN, max=fluidLimitsPropane.SMAX, start=(fluidLimitsPropane.SMIN+fluidLimitsPropane.SMAX)/2));

  final constant FluidConstants
  fluidConstantsPropane(
    casRegistryNumber="74-98-6",
    molarMass=0.04409562,
    hasCriticalData=true,
       criticalTemperature=369.89,
       criticalPressure=4251200,
       criticalMolarVolume=0.00019999999999999996,
       //HCRIT0=555334.1335047669,//CoolProp
       HCRIT0=555235,//EOS calculation
       //SCRIT0=2051.8572148235367,//CoolProp
       SCRIT0=2051.62,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=0.084,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=true,
    hasAccurateConductivityData=true,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.1521,
    triplePointTemperature=85.525,
    triplePointPressure=0.00017184840809308612,
    normalBoilingPoint=231.036,
    meltingPoint=85.525) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsPropane(
    TMIN=fluidConstantsPropane.triplePointTemperature,
    TMAX=650,
    DMIN=Modelica.Constants.small,
    DMAX=908.37,//RefProp
    //DMAX=879.461,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=1000000000,
    HMIN=-197000,
    HMAX=2.43195e6,
    SMIN=-2401,
    SMAX=30674.4) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsPropane(
    idealLead={-4.970583, 4.29352},
    idealLog=[
      3,         1.],
    idealEinstein=[
      3.043,        -1.062478;
      5.874,        -3.344237;
      9.337,        -5.363757;
      7.922,        -11.762957],
    idealASHRAEoffset={3.32799, -1.50725},
    idealIIRoffset={0, 0},
    idealNBPoffset={3.21945, -1.43891},
    residualPoly=[
      0.042910051,    1,    4;
      1.7313671,    0.33,    1;
      -2.4516524,    0.8,    1;
      0.34157466,    0.43,    2;
      -0.46047898,    0.9,    2],
    residualBwr=[
      -0.66847295,    2.46,    1,    1;
      0.20889705,    2.09,    3,    1;
      0.19421381,    0.88,    6,    1;
      -0.22917851,    1.09,    6,    1;
      -0.60405866,    3.25,    2,    2;
      0.066680654,    4.62,    3,    2],
    residualGauss=[
      0.017534618,    0.76,    1,    2,    2,    -0.963,    -2.33,    0.684,    1.283;
      0.33874242,    2.5,    1,    2,    2,    -1.977,    -3.47,    0.829,    0.6936;
      0.22228777,    2.75,    1,    2,    2,    -1.917,    -3.15,    1.419,    0.788;
      -0.23219062,    3.05,    2,    2,    2,    -2.307,    -3.19,    0.817,    0.473;
      -0.09220694,    2.55,    2,    2,    2,    -2.546,    -0.92,    1.5,    0.8577;
      -0.47575718,    8.4,    4,    2,    2,    -3.28,    -18.8,    1.426,    0.271;
      -0.017486824,    6.75,    1,    2,    2,    -14.6,    -547.8,    1.093,    0.948])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsPropane(
    diluteTred=369.85,
    an=[
      -0.00124778,        0;
      0.00816371,        1;
      0.0199374,        2],
    ad=[
      1.0,        0],
    diluteModel=2,
    residualTred=369.82,
    residualDred=220.3,
    b=[
      -0.03695,        0,        1,       0,       0;
      0.148658,        0,        2,       0,       0;
      -0.119986,        0,        3,       0,       0;
      0.0412431,        0,        4,       0,       0;
      -0.00486905,        0,        5,       0,       0;
      0.0482798,        -1,        1,       0,       0;
      -0.135636,        -1,        2,       0,       0;
      0.117588,        -1,        3,       0,       0;
      -0.0436911,        -1,        4,       0,       0;
      0.00616079,        -1,        5,       0,       0],
    residualModel=2,
    Rd=1.03,
    qD=1395410494.88,
    zeta0=1.94e-10,
    Gamma=0.0496,
    gamma=1.239,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsPropane(
    diluteLead=2.1357e-08,
    a=[
      0.25104574,        0;
      -0.47271238,        1;
      0.060836515,        3],
    diluteModel=2,
    sigma=0.49748000000000003,
    epsilon=263.88,
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
    residualTred=369.825,
    residualDMred=5000,
    dp=[
      3.59873030195e-05,        2,        0,        0,        1;
      -0.000180512188564,        2,        1,        0,        1;
      8.77124888223e-05,        2,        2,        0,        1;
      -0.000105773052525,        3,        0,        0,        1;
      0.000205319740877,        3,        1,        0,        1;
      -0.00012921093261,        3,        2,        0,        1;
      5.89491587759e-05,        4,        0,        0,        1;
      -0.0001297400331,        4,        1,        0,        1;
      7.66280419971e-05,        4,        2,        0,        1;
      -9.59407868475e-06,        5,        0,        0,        1;
      2.10726986598e-05,        5,        1,        0,        1;
      -1.43971968187e-05,        5,        2,        0,        1],
    bl=[
      0.00161688405374,        1,        0],
    b0n=[
      2.50053938863,        0;
      2.1517543007382995,        -0.5],
    b0d=[
      1,        0],
    residualModel=2);

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsPropane(
    Tc=369.89,
    coeffs=[
      0.05334,        1.235;
      -0.01748,        4.404]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsPropane(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -23.998635747391152,        1.05;
      18.313017605233238,        1.084;
      -0.42240851966839504,        2.259;
      -2.7378298813798962,        4.287;
      0.257888414168987,        7.66;
      -1.3113462226130785,        18.584],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      2.104068052280433,        0.368;
      0.3371892411622086,        0.875;
      0.4401223810964251,        3.009;
      -3.5679018989260567,        9.51;
      59.93889697061387,        15.381;
      -70.9402469085883,        17.001],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -3.401360845132903,        0.431;
      -1.9443653795380451,        1.339;
      -0.4101211459709529,        2.091;
      -15.598374206544214,        6.822;
      15.844867806184942,        8.214;
      -15.298907422332046,        19.706])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Lemmon-JCED-2009</p>
<p>Viscosity: Vogel-JPCRD-1998</p>
<p>Conductivity: Marsh-JCED-2002</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
<p>setState_psX function is failing in some conditions</p>
</body>
  </html>"));
end Propane;

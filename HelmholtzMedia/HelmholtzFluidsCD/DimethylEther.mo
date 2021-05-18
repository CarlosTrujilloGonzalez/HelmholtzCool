within HelmholtzMedia.HelmholtzFluidsCD;
package DimethylEther "DimethylEther"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="dimethylether" "short name",
  final fluidConstants={fluidConstantsDimethylEther},
  final helmholtzCoefficients=helmholtzCoefficientsDimethylEther,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsDimethylEther,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsDimethylEther,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsDimethylEther,
  final ancillaryCoefficients=ancillaryCoefficientsDimethylEther,
  final fluidLimits=fluidLimitsDimethylEther,
  final refSubstance=ReferenceSubstance.Propane,
  final referenceHelmholtzCoeff = Transport.ECSreferences.helmholtzCoefficientsPropane,
  referenceConstants =  Transport.ECSreferences.fluidConstantsPropane,
  referenceViscosityCoeff = Transport.ECSreferences.dynamicViscosityCoefficientsPropane,
  referenceConductivityCoeff = Transport.ECSreferences.thermalConductivityCoefficientsPropane,
  Density(min=fluidLimitsDimethylEther.DMIN, max=fluidLimitsDimethylEther.DMAX, start=fluidConstantsDimethylEther.molarMass/fluidConstantsDimethylEther.criticalMolarVolume),
  Temperature(min=fluidLimitsDimethylEther.TMIN, max=fluidLimitsDimethylEther.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsDimethylEther.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsDimethylEther.HMIN, max=fluidLimitsDimethylEther.HMAX, start=(fluidLimitsDimethylEther.HMIN+fluidLimitsDimethylEther.HMAX)/2),
  SpecificEntropy(min=fluidLimitsDimethylEther.SMIN, max=fluidLimitsDimethylEther.SMAX, start=(fluidLimitsDimethylEther.SMIN+fluidLimitsDimethylEther.SMAX)/2));

  final constant FluidConstants
  fluidConstantsDimethylEther(
    casRegistryNumber="115-10-6",
    molarMass=0.04606844,
    hasCriticalData=true,
       criticalTemperature=400.378,
       criticalPressure=5336800,
       criticalMolarVolume=0.00016835016835016833,
       //HCRIT0=476304.05280178215,//CoolProp
       HCRIT0=476214,//EOS calculation
       //SCRIT0=1405.2132232712847,//EOS calculation
       SCRIT0=1405.02,//CoolProp
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=1.301,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=true,
    hasAccurateConductivityData=false,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.196,
    triplePointTemperature=131.66,
    triplePointPressure=2.210728491107207,
    normalBoilingPoint=248.368,
    meltingPoint=131.66) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsDimethylEther(
    TMIN=fluidConstantsDimethylEther.triplePointTemperature,
    TMAX=525,
    DMIN=Modelica.Constants.small,
    //DMAX=882.21,//RefProp
    DMAX=901.46,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=50000000,
    HMIN=-252022,
    HMAX=939771,
    SMIN=-1439.68,
    SMAX=28067.8) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsDimethylEther(
    idealLead={-1.980976, 3.171218},
    idealLog=[
      3.039,         1.],
    idealEinstein=[
      2.641,        -0.901647942694154;
      2.123,        -2.432701097462898;
      8.992,        -4.785477723551244;
      6.191,        -10.36520488138709],
    idealIIRoffset={-4.3437, 1.98532},
    idealNBPoffset={0.0, 0.0},
    residualPoly=[
      0.029814139,    1,    4;
      1.43517,    0.4366,    1;
      -2.64964,    1.011,    1;
      -0.29515532,    1.137,    2;
      0.17035607,    0.45,    3],
    residualBwr=[
      -0.94642918,    2.83,    1,    2;
      -0.099250514,    1.5,    3,    2;
      1.1264071,    1.235,    2,    1;
      -0.76936548,    2.675,    2,    2;
      -0.020717696,    0.7272,    7,    1;
      0.24527037,    1.816,    1,    1],
    residualGauss=[
      1.1863438,    1.783,    1,    2,    2,    -0.965336,    -1.28719,    1.27772,    0.672698;
      -0.49398368,    3.779,    1,    2,    2,    -1.50858,    -0.806235,    0.43075,    0.924246;
      -0.16388716,    3.282,    3,    2,    2,    -0.963855,    -0.777942,    0.429607,    0.750815;
      -0.027583584,    1.059,    3,    2,    2,    -9.72643,    -197.681,    1.13849,    0.800022])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsDimethylEther(
    ai={-9.8101e-4,1.22857e-5,-1.60844e-8},
    diluteModel=9,
    nistCoeff={1.12497,-4.88562e-2},
    residualModel=9,
    qD=1851851852,
    zeta0=1.89e-10,
    Gamma=0.057,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsDimethylEther(
    diluteLead=2.1357e-08,
    a=[
      0.294261,        0;
      -0.377826,        1;
      -0.491673,        2],
    diluteModel=2,
    sigma=0.446704,
    epsilon=317.937,
    residualTred=400.378,
    residualDMred=5940,
    dp=[
      -2.70002e-06,        3,        5.92,        0,        0;
      4.44583e-06,        3,        4.36,        0,        0;
      2.1302e-07,        5,        5.87,        0,        0;
      6.50681e-06,        1,        0.45,        0,        0;
      -0.000104998,        3,        2.93,        -1,        1;
      7.827474e-05,        4,        1.64,        -1,        1;
      4.13751e-05,        5,        7.86,        -1,        2;
      -0.000175055,        2,        4.25,        -1,        1;
      6.281975e-05,        2,        4.79,        -1,        1;
      0.0001123219,        2,        3.11,        -1,        2],
    bl=[
      0,        1,        0],
    b0n=[
      1,        0],
    b0d=[
      1,        0],
    residualModel=2);

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsDimethylEther(
    Tc=400.378,
    coeffs=[
      0.063157,        1.2595]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsDimethylEther(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -9.576458382440794,        1.026;
      3.8237850260211683,        1.188;
      2.3534240536183586,        7.78;
      -2.349392868307698,        3.09;
      -3.348742284357154,        6.356;
      -1.2387250144815742,        12.704],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      16.059795192018523,        0.572;
      -14.738564267851407,        0.658;
      -3.731150693384918,        0.713;
      5.144676895857624,        0.916;
      0.03490664751265221,        2.977;
      8.503244669132489,        19.393],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -4.396808750959381,        0.499;
      0.11053731401780381,        0.75;
      -2.8034901380765476,        2.338;
      -577.5554786721015,        11.224;
      2817.238575530162,        12.48;
      -2327.667386669654,        12.984])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Wu-JPCRD-2011</p>
<p>Viscosity: Meng-JCED-2012</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end DimethylEther;

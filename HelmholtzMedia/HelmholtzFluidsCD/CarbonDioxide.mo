within HelmholtzMedia.HelmholtzFluidsCD;
package CarbonDioxide "CarbonDioxide"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="carbondioxide" "short name",
  fluidConstants={fluidConstantsCarbonDioxide},
  helmholtzCoefficients=helmholtzCoefficientsCarbonDioxide,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsCarbonDioxide,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsCarbonDioxide,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsCarbonDioxide,
  final ancillaryCoefficients=ancillaryCoefficientsCarbonDioxide,
  fluidLimits=fluidLimitsCarbonDioxide,
  final refSubstance=ReferenceSubstance.None,
  final referenceHelmholtzCoeff = helmholtzCoefficients,
  final referenceConstants =  fluidConstants[1],
  Density(min=fluidLimitsCarbonDioxide.DMIN, max=fluidLimitsCarbonDioxide.DMAX, start=fluidConstantsCarbonDioxide.molarMass/fluidConstantsCarbonDioxide.criticalMolarVolume),
  Temperature(min=fluidLimitsCarbonDioxide.TMIN, max=fluidLimitsCarbonDioxide.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsCarbonDioxide.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsCarbonDioxide.HMIN, max=fluidLimitsCarbonDioxide.HMAX, start=(fluidLimitsCarbonDioxide.HMIN+fluidLimitsCarbonDioxide.HMAX)/2),
  SpecificEntropy(min=fluidLimitsCarbonDioxide.SMIN, max=fluidLimitsCarbonDioxide.SMAX, start=(fluidLimitsCarbonDioxide.SMIN+fluidLimitsCarbonDioxide.SMAX)/2));

  final constant FluidConstants
  fluidConstantsCarbonDioxide(
    casRegistryNumber="124-38-9",
    molarMass=0.0440098,
    hasCriticalData=true,
       criticalTemperature=304.1282,
       criticalPressure=7377300.0,
       criticalMolarVolume=9.41184770730637e-05,
       //HCRIT0=332258.02875514777,//CoolProp
       HCRIT0=-174553,//EOS calculation
       //SCRIT0=1433.6623918724495,//CoolProp
       SCRIT0=-1305.37,//EOS calculation
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
       acentricFactor=0.22394,
    triplePointTemperature=216.592,
    triplePointPressure=517964.34344772575,
    normalBoilingPoint=194.686,
    meltingPoint=216.592) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsCarbonDioxide(
    TMIN=fluidConstantsCarbonDioxide.triplePointTemperature,
    TMAX=2000,
    DMIN=Modelica.Constants.small,
    DMAX=1638.92,//RefProp
    //DMAX=1602.87,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=800000000,
    HMIN=-430000,
    HMAX=2.57502e6,
    SMIN=-2919.58,
    SMAX=28022.1) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsCarbonDioxide(
    idealLead={8.37304456, -3.70454304},
    idealLog=[
      2.5,         1.],
    idealEinstein=[
      1.99427042,        -3.15163;
      0.62105248,        -6.1119;
      0.41195293,        -6.77708;
      1.04028922,        -11.32384;
      0.08327678,        -27.08792],
    idealASHRAEoffset={-10.9746, 6.85514},
    idealIIRoffset={-14.4979, 8.82014},
    idealNBPoffset={-13.0705, 7.99453},
    residualPoly=[
      0.388568232032,    0,    1;
      2.93854759427,    0.75,    1;
      -5.5867188535,    1,    1;
      -0.767531995925,    2,    1;
      0.317290055804,    0.75,    2;
      0.548033158978,    2,    2;
      0.122794112203,    0.75,    3],
    residualBwr=[
      2.16589615432,    1.5,    1,    1;
      1.58417351097,    1.5,    2,    1;
      -0.231327054055,    2.5,    4,    1;
      0.0581169164314,    0,    5,    1;
      -0.553691372054,    1.5,    5,    1;
      0.489466159094,    2,    5,    1;
      -0.0242757398435,    0,    6,    1;
      0.0624947905017,    1,    6,    1;
      -0.121758602252,    2,    6,    1;
      -0.370556852701,    3,    1,    2;
      -0.0167758797004,    6,    1,    2;
      -0.11960736638,    3,    4,    2;
      -0.0456193625088,    6,    4,    2;
      0.0356127892703,    8,    4,    2;
      -0.00744277271321,    6,    7,    2;
      -0.00173957049024,    0,    8,    2;
      -0.0218101212895,    7,    2,    3;
      0.0243321665592,    12,    3,    3;
      -0.0374401334235,    16,    3,    3;
      0.143387157569,    22,    5,    4;
      -0.134919690833,    24,    5,    4;
      -0.0231512250535,    16,    6,    4;
      0.0123631254929,    24,    7,    4;
      0.00210583219729,    8,    8,    4;
      -0.000339585190264,    2,    10,    4;
      0.00559936517716,    28,    4,    5;
      -0.000303351180556,    14,    8,    6],
    residualGauss=[
      -213.654886883,    1,    2,    2,    2,    -25,    -325,    1.16,    1;
      26641.5691493,    0,    2,    2,    2,    -25,    -300,    1.19,    1;
      -24027.2122046,    1,    2,    2,    2,    -25,    -300,    1.19,    1;
      -283.41603424,    3,    3,    2,    2,    -15,    -275,    1.25,    1;
      212.472844002,    3,    3,    2,    2,    -20,    -275,    1.22,    1],
    residualNonAnalytical=[
      -0.666422765408,  0.0,  1.0,  2,  2,  0.875,    0.3,    0.7,    10,    275,    0.3,    3.5;
      0.726086323499,  0.0,  1.0,  2,  2,  0.925,    0.3,    0.7,    10,    275,    0.3,    3.5;
      0.0550686686128,  0.0,  1.0,  2,  2,  0.875,    1,    0.7,    12.5,    275,    0.3,    3])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsCarbonDioxide(
    diluteModel=0,//CoolProp
    /*diluteTred=304.1282,
    an=[1, 0.5],
    ad=[1.51874307e1, 0;
        2.80674040e1, -1;
        2.28564190e1, -2;
        -7.4162421, -3],
    diluteModel=2,//Huber et alt. 2016*/
    b=[
      0.0370597124660408,        0.0,        1.0,        0,        0;
      0.0007696647124242399,        0.0,        5.0,        0,        0;
      0.0075538113451464,        -1.5,        1.0,        0,        0;
      -0.032416436589336,        0.0,        1.0,        5,        2;
      0.078894098855904,        -1.0,        2.0,        5,        2;
      0.0177830586854928,        -1.5,        0.0,        5,        2;
      0.10744756315137599,        -1.5,        5.0,        5,        2;
      0.31839746259479995,        -1.5,        9.0,        5,        2;
      -0.00082691726160072,        -3.5,        0.0,        5,        2;
      2.0846013855224798e-05,        -5.5,        0.0,        5,        2],
    residualModel=3,//CoolProp
    /*residualTred=304.1282,
    residualDred=476.6,
    b=[1.00128e1, 4.30829, 0, 0, 0;
    5.60488e1, -3.58563e1, 0, 0, 0;
    -8.11620e1, 6.71480e1, 0, 0, 0;
    6.24337e1, -5.22855e1, 0, 0, 0;
    -2.06336e1, 1.74571e1, 0 ,0, 0;
    2.53248, -1.96414, 0, 0, 0],
    residualModel=4,//Huber et alt. 2016*/
    criticalModel=1//CoolProp
    /*Tref=456.19,
    Rd=1.02,
    qD=2.5e9,
    zeta0=1.5e-10,
    Gamma=0.052,
    gamma=1.239,
    criticalModel=2//Huber et alt.2016*/
    );

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsCarbonDioxide(
    sigma=1.0,
    epsilon=251.196,
    diluteLead=1.5178953643112785e-07,
    a=[
      0.235156,        0;
      -0.491266,        1;
      0.05211155,        2;
      0.05347906,        3;
      -0.01537102,        4],
    diluteModel=2,
    residualTred=304.1282,
    residualDMred=10624.9,
    dp=[
      1.9036541208525784e-06,        1,        0,        0,        1;
      1.57384720473354e-05,        2,        0,        0,        1;
      1.4207809578440784e-07,        6,        3,        0,        1;
      6.79058431241662e-08,        8,        0,        0,        1;
      -3.0732988514867565e-08,        8,        1,        0,        0],
    bl=[
      0,        1,        0],
    b0n=[
      1,        0],
    b0d=[
      1,        0],
    residualModel=2  );

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsCarbonDioxide(
    coeffs=[
      0.07863,        1.254]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsCarbonDioxide(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -5.867399337600407,        0.983;
      -7.10969550015274,        1.322;
      11.022781986239263,        1.488;
      4.8260764050219995,        2.807;
      -6.240803382557819,        3.571;
      -6.7009642572439,        1.941],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      0.861951794789174,        0.264;
      5.535795098719573,        0.672;
      -21.766373764605415,        0.986;
      20.01416999278327,        1.092;
      -2.2218647220786862,        1.714;
      888.2387848519858,        9.902],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -1.1635587811569494,        0.306;
      -3.64216164754343,        0.569;
      2.7773118075713237,        0.677;
      -3.2573848494624533,        0.891;
      -1.9739104682508852,        3.206;
      -16.057319994659142,        6.093])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Span-JPCRD-1996</p>
<p>Viscosity: Fenghour-JPCRD-1998</p>
<p>Conductivity: Scalabrin-JPCRD-2006-CO2</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end CarbonDioxide;

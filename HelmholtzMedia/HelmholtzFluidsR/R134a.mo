within HelmholtzMedia.HelmholtzFluidsR;
package R134a "R134a"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="r134a" "short name",
  final fluidConstants={fluidConstantsR134a},
  final helmholtzCoefficients=helmholtzCoefficientsR134a,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsR134a,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsR134a,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsR134a,
  final ancillaryCoefficients=ancillaryCoefficientsR134a,
  final fluidLimits=fluidLimitsR134a,
  final refSubstance=ReferenceSubstance.R134a,
  final referenceHelmholtzCoeff = HelmholtzFluidsR.R134a.helmholtzCoefficientsR134a,
  final referenceConstants =  HelmholtzFluidsR.R134a.fluidConstantsR134a,
  final referenceViscosityCoeff = HelmholtzFluidsR.R134a.dynamicViscosityCoefficientsR134a,
  final referenceConductivityCoeff = HelmholtzFluidsR.R134a.thermalConductivityCoefficientsR134a,
  Density(min=fluidLimitsR134a.DMIN, max=fluidLimitsR134a.DMAX, start=fluidConstantsR134a.molarMass/fluidConstantsR134a.criticalMolarVolume),
  Temperature(min=fluidLimitsR134a.TMIN, max=fluidLimitsR134a.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsR134a.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsR134a.HMIN, max=fluidLimitsR134a.HMAX, start=(fluidLimitsR134a.HMIN+fluidLimitsR134a.HMAX)/2),
  SpecificEntropy(min=fluidLimitsR134a.SMIN, max=fluidLimitsR134a.SMAX, start=(fluidLimitsR134a.SMIN+fluidLimitsR134a.SMAX)/2));

  final constant FluidConstants
  fluidConstantsR134a(
    casRegistryNumber="811-97-2",
    molarMass=0.102032,
    hasCriticalData=true,
       criticalTemperature=374.18,
       criticalPressure=4059280,
       criticalMolarVolume=0.0002008503936978331,
       //HCRIT0=390111.86794450774,//CoolProp
       HCRIT0=390065,//EOS calculation
       //SCRIT0=1563.3598557175133,//CoolProp
       SCRIT0=1563.25,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=2.058,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=true,
    hasAccurateConductivityData=true,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.32684,
    triplePointTemperature=169.85,
    triplePointPressure=389.56378856198955,
    normalBoilingPoint=247.076,
    meltingPoint=169.85) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsR134a(
    TMIN=fluidConstantsR134a.triplePointTemperature,
    TMAX=455,
    DMIN=Modelica.Constants.small,
    DMAX=1591.7,//RefProp
    //DMAX=1659,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=70000000,
    HMIN=7.1454e4,
    HMAX=577754,
    SMIN=350.7,
    SMAX=13649.3) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsR134a(
    idealLead={-1.019535, 9.047135},
    idealLog=[
      -1.629789,         1.],
    idealPower=[
      -9.723916,      -0.5;
      -3.92717,      -0.75],
    idealASHRAEoffset={9.76341, -4.85853},      
    idealIIRoffset={0, 0},
    idealNBPoffset={10.6646, -5.43791},
    residualPoly=[
      0.05586817,    -0.5,    2;
      0.498223,    0,    1;
      0.02458698,    0,    3;
      0.0008570145,    0,    6;
      0.0004788584,    1.5,    6;
      -1.800808,    1.5,    1;
      0.2671641,    2,    1;
      -0.04781652,    2,    2],
    residualBwr=[
      0.01423987,    1,    5,    1;
      0.3324062,    3,    2,    1;
      -0.007485907,    5,    2,    1;
      0.0001017263,    1,    4,    2;
      -0.5184567,    5,    1,    2;
      -0.08692288,    5,    4,    2;
      0.2057144,    6,    1,    2;
      -0.005000457,    10,    2,    2;
      0.0004603262,    10,    4,    2;
      -0.003497836,    10,    1,    3;
      0.006995038,    18,    5,    3;
      -0.01452184,    22,    3,    3;
      -0.0001285458,    50,    10,    4])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsR134a(
    diluteTred=1,
    an=[
      -0.0105248,        0;
      8.00982e-05,        1],
    ad=[
      1.0,        0],
    diluteModel=2,
    residualTred=1,
    residualDred=515.249968352,
    b=[
      0.0037740609300000003,        0,        1,       0,       0;
      0.010534223865,        0,        2,       0,       0;
      -0.002952794565,        0,        3,       0,       0;
      0.00128672592,        0,        4,       0,       0],
    residualModel=2,
    Rd=1.03,
    qD=1892020000.0,
    zeta0=1.94e-10,
    Gamma=0.0496,
    gamma=1.239,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsR134a(
    diluteLead=2.1357e-08,
    a=[
      0.355404,        0;
      -0.464337,        1;
      0.0257353,        2],
    diluteModel=2,
    sigma=0.46893199999999996,
    epsilon=299.363,
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
    residualTred=374.21,
    residualDMred=5017.053,
    dp=[
      -2.06900719e-05,        1,        0,        0,        1;
      3.56029549e-07,        2,        6,        0,        1;
      2.11101816e-06,        2,        2,        0,        1;
      1.39601415e-05,        2,        0.5,        0,        1;
      -4.5643502e-06,        2,        -2,        0,        1;
      -3.51593275e-06,        3,        0,        0,        1],
    bl=[
      0.00021476332,        0,        0],
    b0n=[
      3.163695636,        0],
    b0d=[
      1,        0;
      -0.0890173375,        -1;
      0.100035295,        -2],
    residualModel=2);

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsR134a(
    Tc=374.21,
    coeffs=[
      0.05801,        1.241]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsR134a(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      0.4331478287291047,        0.845;
      -9.090302559074352,        0.99;
      2.1476074125217703,        1.14;
      -1.557687007603464,        2.651;
      -3.5020328972698604,        4.507;
      14.958442337201044,        17.235],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      18.772731940930015,        0.673;
      -51.49939472178225,        0.994;
      40.793536440596085,        1.257;
      -1481.6500471538966,        5.783;
      1600.534434298925,        5.943;
      -67338.52423732559,        19.94],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -5.147386240766544,        0.476;
      5.34618043286371,        0.966;
      -7.611015272838434,        1.321;
      -28.85436432788653,        8.491;
      -9.079306067130748,        13.463;
      64.0,        13.463])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: TillnerRoth-JPCRD-1994</p>
<p>Viscosity: Huber-IECR-2003</p>
<p>Conductivity: McLinden-IJR-2000</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end R134a;

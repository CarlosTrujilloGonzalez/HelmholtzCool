within HelmholtzMedia.HelmholtzFluids;
package Air "Air"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="air" "short name",
  final fluidConstants={fluidConstantsAir},
  final helmholtzCoefficients=helmholtzCoefficientsAir,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsAir,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsAir,
  //final surfaceTensionCoefficients=surfaceTensionCoefficientsAir,
  final ancillaryCoefficients=ancillaryCoefficientsAir,
  final fluidLimits=fluidLimitsAir,
  Density(min=fluidLimitsAir.DMIN, max=fluidLimitsAir.DMAX, start=fluidConstantsAir.molarMass/fluidConstantsAir.criticalMolarVolume),
  Temperature(min=fluidLimitsAir.TMIN, max=fluidLimitsAir.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsAir.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsAir.HMIN, max=fluidLimitsAir.HMAX, start=(fluidLimitsAir.HMIN+fluidLimitsAir.HMAX)/2),
  SpecificEntropy(min=fluidLimitsAir.SMIN, max=fluidLimitsAir.SMAX, start=(fluidLimitsAir.SMIN+fluidLimitsAir.SMAX)/2));

  final constant FluidConstants
  fluidConstantsAir(
    casRegistryNumber="AIR.PPF",
    molarMass=0.02896546,
    hasCriticalData=true,
       criticalTemperature=132.6312,
       criticalPressure=3786000.0,
       criticalMolarVolume=9.571484632981421e-05,
       //HCRIT0=155946.9451964694,//CoolProp
       HCRIT0=38236.2,//EOS calculation
       //SCRIT0=1372.3552681314545,//CoolProp
       SCRIT0=4413.51,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=0.0,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=true,
    hasAccurateConductivityData=true,
    hasVapourPressureCurve=false,
    hasAcentricFactor=true,
       acentricFactor=0.0335,
    triplePointTemperature=59.75,
    triplePointPressure=5264.1810687705665,
    normalBoilingPoint=78.903,
    meltingPoint=59.75) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsAir(
    TMIN=fluidConstantsAir.triplePointTemperature,
    TMAX=2000,
    DMIN=Modelica.Constants.small,
    //DMAX=1556.3,
    DMAX=1508.53,//EOS calculation

    PMIN=Modelica.Constants.small,
    PMAX=2000000000,
    HMIN=-1.6e5,
    HMAX=+3.94385e6,
    SMIN=765.6,
    SMAX=10949) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsAir(
    idealLead={0, 0},
    idealPower=[
      6.057194e-08,      -3;
      -2.10274769e-05,      -2;
      -0.000158860716,      -1;
      -13.841928076,      0;
      17.275266575,      1;
      -0.00019536342,      1.5],
    idealLog=[
      2.490888032,         1.],
    idealEinstein=[
      0.791309509,        -25.36365;
      0.212236768,        -16.90741],
    idealEinsteinGeneralized=[
      -0.197938904,        0.6666666666666666,        1,        87.31279],
    idealNBPoffset={10.3753039487406, 3.31112445645577},
    
    residualPoly=[
      0.118160747229,    0,    1;
      0.713116392079,    0.33,    1;
      -1.61824192067,    1.01,    1;
      0.0714140178971,    0,    2;
      -0.0865421396646,    0,    3;
      0.134211176704,    0.15,    3;
      0.0112626704218,    0,    4;
      -0.0420533228842,    0.2,    4;
      0.0349008431982,    0.35,    4;
      0.000164957183186,    1.35,    6],
    residualBwr=[
      -0.101365037912,    1.6,    1,    1;
      -0.17381369097,    0.8,    3,    1;
      -0.0472103183731,    0.95,    5,    1;
      -0.0122523554253,    1.25,    6,    1;
      -0.146629609713,    3.6,    1,    2;
      -0.0316055879821,    6,    3,    2;
      0.000233594806142,    3.25,    11,    2;
      0.0148287891978,    3.5,    1,    3;
      -0.00938782884667,    15,    3,    3])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsAir(
    an=[
      0.001308,        0;
      0.001405,        -1.1;
      -0.001036,        -0.3],
    diluteModel=3,
    b=[
      0.008743,        0.1,        1,        0,        0;
      0.01476,        0.0,        2,        0,        0;
      -0.01662,        0.5,        3,        1,        2;
      0.003793,        2.7,        7,        1,        2;
      -0.006142,        0.3,        7,        1,        2;
      -0.0003778,        1.3,        11,        1,        2],
    residualModel=3,
    Tref=265.262,
    Rd=1.01,
    qD=3225806451.6,
    zeta0=1.1e-10,
    Gamma=0.055,
    gamma=1.2415,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsAir(
    sigma=0.36,
    epsilon=103.3,
    diluteLead=2.66958e-08,
    a=[
      0.431,        0;
      -0.4623,        1;
      0.08406,        2;
      0.005341,        3;
      -0.00331,        4],
    diluteModel=2,
    residualTred=132.6312,
    residualDMred=10447.7,
    dp=[
      1.072e-05,        1,        0.2,        0,        0;
      1.122e-06,        4,        0.05,        0,        0;
      2.019e-09,        9,        2.4,        0,        0;
      -8.876e-06,        1,        0.6,        -1,        1;
      -2.916e-08,        8,        3.6,        -1,        1],
    bl=[
      0,        1,        0],
    b0n=[
      1,        0],
    b0d=[
      1,        0],
    residualModel=2);

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsAir(
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      23549.22872973586,        0.052000000000000005;
      -36125.479937395976,        0.058;
      29748.003516251414,        0.08600000000000001;
      -25536.830521053136,        0.10700000000000001;
      8367.433264822796,        0.125;
      1.3265163441261232,        8.0],
	densityVaporModel=DensityVaporModel.DV3,
	densityVapor=[
      -2.0466,        0.41;
      -4.752,        1.0;
      -13.259,        2.8;
      -47.652,        6.5])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Lemmon-JPCRD-2000</p>
<p>Viscosity: Lemmon-IJT-2004</p>
<p>Conductivity: Lemmon-IJT-2004</p>
</body>
</html>"));
end Air;

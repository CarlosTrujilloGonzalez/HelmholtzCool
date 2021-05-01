within HelmholtzMedia.HelmholtzFluidsIJK;
package Isopentane "Isopentane"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="isopentane" "short name",
  final fluidConstants={fluidConstantsIsopentane},
  final helmholtzCoefficients=helmholtzCoefficientsIsopentane,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsIsopentane,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsIsopentane,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsIsopentane,
  final ancillaryCoefficients=ancillaryCoefficientsIsopentane,
  final fluidLimits=fluidLimitsIsopentane,
  final refSubstance=ReferenceSubstance.None,
  final referenceHelmholtzCoeff = helmholtzCoefficients,
  final referenceConstants =  fluidConstants[1],
  Density(min=fluidLimitsIsopentane.DMIN, max=fluidLimitsIsopentane.DMAX, start=fluidConstantsIsopentane.molarMass/fluidConstantsIsopentane.criticalMolarVolume),
  Temperature(min=fluidLimitsIsopentane.TMIN, max=fluidLimitsIsopentane.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsIsopentane.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsIsopentane.HMIN, max=fluidLimitsIsopentane.HMAX, start=(fluidLimitsIsopentane.HMIN+fluidLimitsIsopentane.HMAX)/2),
  SpecificEntropy(min=fluidLimitsIsopentane.SMIN, max=fluidLimitsIsopentane.SMAX, start=(fluidLimitsIsopentane.SMIN+fluidLimitsIsopentane.SMAX)/2));

  final constant FluidConstants
  fluidConstantsIsopentane(
    casRegistryNumber="78-78-4",
    molarMass=0.07214878,
    hasCriticalData=true,
       criticalTemperature=460.35,
       criticalPressure=3378000,
       criticalMolarVolume=0.0003057169061449098,
       //HCRIT0=503680.45603233407,//CoolProp
       HCRIT0=503558,//EOS calculation
       //SCRIT0=1282.9872146991836,//CoolProp
       SCRIT0=1282.74,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=0.11,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=true,
    hasAccurateConductivityData=true,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.2274,
    triplePointTemperature=112.65,
    triplePointPressure=8.949025483876957e-05,
    normalBoilingPoint=300.98,
    meltingPoint=112.65) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsIsopentane(
    TMIN=fluidConstantsIsopentane.triplePointTemperature,
    TMAX=500,
    DMIN=Modelica.Constants.small,
    DMAX=959.6,//RefProp
    //DMAX=939.609,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=1000000000,
    HMIN=-361358,
    HMAX=1.5896e6,
    SMIN=-2819.12,
    SMAX=18193.5) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsIsopentane(
    idealLead={2.5822330405, 1.1609103419},
    idealLog=[
      3,         1.],
    idealEinstein=[
      7.4056,        -0.9601390246551537;
      9.5772,        -2.409036602584989;
      15.765,        -4.494406429890301;
      12.119,        -9.108287172803301],
    idealIIRoffset={-17.6081648486994, 10.3134499204439},
    idealNBPoffset={0, 0},
    residualPoly=[
      1.0963,    0.25,    1;
      -3.0402,    1.125,    1;
      1.0317,    1.5,    1;
      -0.1541,    1.375,    2;
      0.11535,    0.25,    3;
      0.00029809,    0.875,    7],
    residualBwr=[
      0.39571,    0.625,    2,    1;
      -0.045881,    1.75,    5,    1;
      -0.35804,    3.625,    1,    2;
      -0.10107,    3.625,    4,    2;
      -0.035484,    14.5,    3,    3;
      0.018156,    12,    4,    3])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsIsopentane(
    diluteTred=460.35,
    an=[
      0.000773049,        0;
      -0.0159754,        1;
      0.218987,        2;
      -0.329556,        3;
      0.281075,        4;
      0.053326,        5],
    ad=[
      5.10467,        0;
      -8.12044,        1;
      8.11607,        2;
      -0.294969,        3;
      1,        4],
    diluteModel=2,
    residualTred=460.35,
    residualDred=236.0,
    b=[
      -0.0117507,        0,        1,       0,       0;
      0.00514003,        -1,        1,       0,       0;
      -0.0161346,        0,        2,       0,       0;
      0.0558445,        -1,        2,       0,       0;
      0.0527254,        0,        3,       0,       0;
      -0.0951474,        -1,        3,       0,       0;
      -0.027494,        0,        4,       0,       0;
      0.0475268,        -1,        4,       0,       0;
      0.00454817,        0,        5,       0,       0;
      -0.00729296,        -1,        5,       0,       0],
    residualModel=2,
    Rd=1.02,
    qD=1506024096.3855422,
    zeta0=2.27e-10,
    Gamma=0.058,
    gamma=1.239,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsIsopentane(
    diluteTred=460.35,
    acentric=0.2274,
    dipole=0.1,
    kappa=0.0,
    MM=0.07214878,
    diluteModel=6,
    initialModel=0,
    residualTred=460.35,
    residualDMred=3271.0,
    corrL=32,
    coefL={-5.8108,7.0656E+02,1.4826E-02,-1.8547E-05,0.0},
    residualModel=6);

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsIsopentane(
    Tc=460.35,
    coeffs=[
      0.051,        1.209]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsIsopentane(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -8.6020554503746,        1.02;
      4.597427498957886,        1.348;
      -2.60028502453596,        1.678;
      -3.205323615957216,        4.158;
      0.893056340939176,        11.692;
      -3.317655495530999,        14.291],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      1.90090139367392,        0.335;
      0.5608577220827222,        0.852;
      0.291792033747788,        2.009;
      -0.22951340206902662,        4.806;
      50.602054710991816,        14.584;
      -59.20907806248923,        15.417],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -0.293842156388657,        0.192;
      -3.3757748736495574,        0.477;
      -2.160437982604624,        1.313;
      -8.713491274417024,        5.085;
      4.916720756118398,        6.047;
      -0.9275607204099507,        14.238])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Lemmon-JCED-2006</p>
<p>Viscosity: Chung-IECR-1988</p>
<p>Conductivity: Vassiliou-JPCRD-2015-pentanes</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end Isopentane;

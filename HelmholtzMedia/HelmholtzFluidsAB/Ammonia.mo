within HelmholtzMedia.HelmholtzFluidsAB;
package Ammonia "Ammonia"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="ammonia" "short name",
  final fluidConstants={fluidConstantsAmmonia},
  final helmholtzCoefficients=helmholtzCoefficientsAmmonia,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsAmmonia,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsAmmonia,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsAmmonia,
  final ancillaryCoefficients=ancillaryCoefficientsAmmonia,
  final fluidLimits=fluidLimitsAmmonia,
  final refSubstance=ReferenceSubstance.None,
  final referenceHelmholtzCoeff = helmholtzCoefficients,
  final referenceConstants =  fluidConstantsAmmonia,
  Density(min=fluidLimitsAmmonia.DMIN, max=fluidLimitsAmmonia.DMAX, start=fluidConstantsAmmonia.molarMass/fluidConstantsAmmonia.criticalMolarVolume),
  Temperature(min=fluidLimitsAmmonia.TMIN, max=fluidLimitsAmmonia.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsAmmonia.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsAmmonia.HMIN, max=fluidLimitsAmmonia.HMAX, start=(fluidLimitsAmmonia.HMIN+fluidLimitsAmmonia.HMAX)/2),
  SpecificEntropy(min=fluidLimitsAmmonia.SMIN, max=fluidLimitsAmmonia.SMAX, start=(fluidLimitsAmmonia.SMIN+fluidLimitsAmmonia.SMAX)/2));

  final constant FluidConstants
  fluidConstantsAmmonia(
    casRegistryNumber="7664-41-7",
    molarMass=0.01703026,
    hasCriticalData=true,
       criticalTemperature=405.4,
       criticalPressure=11333000.0,
       criticalMolarVolume=7.56900444444444e-05,
       //HCRIT0=1262375.2616851379,//CoolProp
       HCRIT0=1.11922e6,//EOS calculation
       //SCRIT0=4025.7460553540345,//CoolProp
       SCRIT0=3554.15,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=1.5,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=true,
    hasAccurateConductivityData=true,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.25601,
    triplePointTemperature=195.495,
    triplePointPressure=6091.2231081315085,
    normalBoilingPoint=239.65,
    meltingPoint=195.495) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsAmmonia(
    TMIN=fluidConstantsAmmonia.triplePointTemperature,
    TMAX=700,
    DMIN=Modelica.Constants.small,
    DMAX=901.156,//RefProp
    //DMAX=886.83,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=1000000000,
    HMIN=-1.5e5,
    HMAX=+2.82106e6,
    SMIN=-1193.76,
    SMAX=75544) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsAmmonia(
    idealLead={-15.81502, 4.255726},
    idealLog=[
      -1,         1.],
    idealPower=[
      11.47434,      0.3333333333333333;
      -1.296211,      -1.5;
      0.5706757,      -1.75],
    idealASHRAEoffset={0.587301, -0.0968559},
    idealIIRoffset={0, 0},
    idealNBPoffset={0.836675, -0.242477},
    residualPoly=[
      0.04554431,    -0.5,    2;
      0.7238548,    0.5,    1;
      0.0122947,    1,    4;
      -1.858814,    1.5,    1;
      2.141882e-11,    3,    15],
    residualBwr=[
      -0.0143002,    0,    3,    1;
      0.3441324,    3,    3,    1;
      -0.2873571,    4,    1,    1;
      2.352589e-05,    4,    8,    1;
      -0.03497111,    5,    2,    1;
      0.02397852,    3,    1,    2;
      0.001831117,    5,    8,    2;
      -0.04085375,    6,    1,    2;
      0.2379275,    8,    2,    2;
      -0.03548972,    8,    3,    2;
      -0.1823729,    10,    2,    2;
      0.02281556,    10,    4,    2;
      -0.006663444,    5,    3,    3;
      -0.008847486,    7.5,    1,    3;
      0.002272635,    15,    2,    3;
      -0.0005588655,    30,    4,    3])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsAmmonia(
    diluteTred=1,
    an=[
      0.03589,        0;
      -0.000175,        1;
      4.551e-07,        2;
      1.685e-10,        3;
      -4.828e-13,        4],
    ad=[
      1.0,        0],
    diluteModel=2,
    residualTred=1,
    residualDred=235,
    b=[
      0.03808645,        0,        1,       0,       0;
      0.06647986,        0,        2,       0,       0;
      -0.0300295,        0,        3,       0,       0;
      0.00998779,        0,        4,       0,       0],
    residualModel=2,    
    criticalModel=1);
    
  /*final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsAmmonia(
    corrG=120,
    coefG={9.6608E-06,1.3799,0.0,0.0,0.0},
    diluteModel=10,
    corrL=50,
    coefL={1.169E+00,-2.314E-03,0.0,0.0,0.0},
    kappa=-0.05,
    residualModel=10);*/

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsAmmonia(
    sigma=0.2957,
    epsilon=386,
    diluteLead=2.1357e-06,
    a=[
      4.9931822,        0;
      -0.61122364,        1;
      0.0,        2;
      0.18535124,        3;
      -0.11160946,        4],
    diluteModel=2,
    b=[
      -1.7999496,        -0.0,        0;
      46.692621,        -0.5,        0;
      -534.60794,        -1.0,        0;
      3360.4074,        -1.5,        0;
      -13019.164,        -2.0,        0;
      33414.23,        -2.5,        0;
      -58711.743,        -3.0,        0;
      71426.686,        -3.5,        0;
      -59834.012,        -4.0,        0;
      33652.741,        -4.5,        0;
      -12027.35,        -5.0,        0;
      2434.8205,        -5.5,        0;
      -208.07957,        -6.0,        0],
    initialModel=2,
    residualTred=405.4,
    residualDMred=13211.8,
    dp=[
      4.005040600989671e-06,        3,        0,        0,        1;
      -1.4107915123955129e-05,        3,        1,        0,        1;
      3.4760743039321816e-05,        2,        2,        0,        1;
      4.631310990138071e-06,        4,        2,        0,        1;
      -3.937374461785061e-06,        4,        3,        0,        1;
      -1.200075068367531e-05,        2,        4,        0,        1;
      1.9284977991745303e-06,        4,        4,        0,        1],
    bl=[
      0.0,        1,        0],
    b0n=[
      1,        0],
    b0d=[
      1,        0],
    residualModel=2);

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsAmmonia(
    Tc=405.4,
    coeffs=[
      0.1028,        1.211;
      -0.09453,        5.585]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsAmmonia(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      0.0016131703802769548,        0.108;
      0.01339903644956835,        0.435;
      -6.4517151211338994,        0.971;
      -4.349105787320862,        4.023;
      1.8295554336003688,        4.944;
      7.011533373126273,        17.494],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      0.6217530323464998,        0.217;
      116.65648581323893,        0.713;
      -116.06575843470785,        0.724;
      2.722640286484237,        1.557;
      -2.6080795358675433,        3.994;
      18.393705416728867,        9.339],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      1.2911157089516188,        0.037;
      -1.4201786958021996,        0.04;
      -145.4871281248165,        0.584;
      140.71212306607288,        0.585;
      -3.147462914747211,        2.858;
      -0.9907144617787934,        6.099])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2018</b></p>
<p>EOS: TillnerRoth-DKV-1993</p>
<p>Viscosity: Fenghour-JPCRD-1995</p>
<p>Conductivity: Tufeu-BBPC-1984</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end Ammonia;

within HelmholtzMedia.HelmholtzFluidsIJK;
package IsoButane "IsoButane"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="isobutane" "short name",
  final fluidConstants={fluidConstantsIsoButane},
  final helmholtzCoefficients=helmholtzCoefficientsIsoButane,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsIsoButane,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsIsoButane,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsIsoButane,
  final ancillaryCoefficients=ancillaryCoefficientsIsoButane,
  final fluidLimits=fluidLimitsIsoButane,
  final refSubstance=ReferenceSubstance.None,
  final referenceHelmholtzCoeff = helmholtzCoefficients,
  final referenceConstants =  fluidConstants[1],
  Density(min=fluidLimitsIsoButane.DMIN, max=fluidLimitsIsoButane.DMAX, start=fluidConstantsIsoButane.molarMass/fluidConstantsIsoButane.criticalMolarVolume),
  Temperature(min=fluidLimitsIsoButane.TMIN, max=fluidLimitsIsoButane.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsIsoButane.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsIsoButane.HMIN, max=fluidLimitsIsoButane.HMAX, start=(fluidLimitsIsoButane.HMIN+fluidLimitsIsoButane.HMAX)/2),
  SpecificEntropy(min=fluidLimitsIsoButane.SMIN, max=fluidLimitsIsoButane.SMAX, start=(fluidLimitsIsoButane.SMIN+fluidLimitsIsoButane.SMAX)/2));

  final constant FluidConstants
  fluidConstantsIsoButane(
    casRegistryNumber="75-28-5",
    molarMass=0.0581222,
    hasCriticalData=true,
       criticalTemperature=407.81,
       criticalPressure=3629000,
       criticalMolarVolume=0.00025774811529933483,
       //HCRIT0=634044.8109689238,//CoolProp
       HCRIT0=32272.7,//EOS calculation
       //SCRIT0=2226.132488082729,//CoolProp
       SCRIT0=-292.979,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=0.132,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=true,
    hasAccurateConductivityData=true,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.183531783208,
    triplePointTemperature=113.73,
    triplePointPressure=0.022890839011893836,
    normalBoilingPoint=261.401,
    meltingPoint=113.73) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsIsoButane(
    TMIN=fluidConstantsIsoButane.triplePointTemperature,
    TMAX=575,
    DMIN=Modelica.Constants.small,
    DMAX=749.78,//RefProp
    //DMAX=752.173,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=35000000,
    HMIN=-714041,
    HMAX=633006,
    SMIN=-3243.6,
    SMAX=21251.9) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsIsoButane(
    idealLead={11.60865546, -5.29450411},
    idealLog=[
      3.05956619,         1.],
    idealEinstein=[
      4.94641014,        -0.951277902;
      4.09475197,        -2.387895885;
      15.6632824,        -4.346904269;
      9.73918122,        -10.36885864],
    idealIIRoffset={-17.6081648486994, 10.3134499204439},
    idealNBPoffset={-11.3085, 7.33947},
    residualPoly=[
      2.0686820727966,    0.5,    1;
      -3.6400098615204,    1,    1;
      0.51968754427244,    1.5,    1;
      0.17745845870123,    0,    2;
      -0.12361807851599,    0.5,    3;
      0.045145314010528,    0.5,    4;
      0.03047647996598,    0.75,    4],
    residualBwr=[
      0.75508387706302,    2,    1,    1;
      -0.85885381015629,    2.5,    1,    1;
      0.036324009830684,    2.5,    2,    1;
      -0.01954879945055,    1.5,    7,    1;
      -0.004445239290496,    1,    8,    1;
      0.004641076366646,    1.5,    8,    1;
      -0.071444097992825,    4,    1,    2;
      -0.080765060030713,    7,    2,    2;
      0.15560460945053,    3,    3,    2;
      0.0020318752160332,    7,    3,    2;
      -0.10624883571689,    3,    4,    2;
      0.039807690546305,    1,    5,    2;
      0.016371431292386,    6,    5,    2;
      0.00053212200682628,    0,    10,    2;
      -0.0078681561156387,    6,    2,    3;
      -0.0030981191888963,    13,    6,    3],
    residualGauss=[
      -0.042276036810382,    2,    1,    2,    2,    -10,    -150,    1.16,    0.85;
      -0.0053001044558079,    0,    2,    2,    2,    -10,    -200,    1.13,    1])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsIsoButane(
    diluteTred=407.85,
    an=[
      -0.00237901,        0;
      0.0106601,        1;
      0.0215811,        2],
    ad=[
      1.0,        0],
    diluteModel=2,
    residualTred=407.85,
    residualDred=224.4,
    b=[
      -0.0411789,        0,        1,       0,       0;
      0.146805,        0,        2,       0,       0;
      -0.11919,        0,        3,       0,       0;
      0.0410226,        0,        4,       0,       0;
      -0.00488704,        0,        5,       0,       0;
      0.0476346,        -1,        1,       0,       0;
      -0.128445,        -1,        2,       0,       0;
      0.107565,        -1,        3,       0,       0;
      -0.0385968,        -1,        4,       0,       0;
      0.00520901,        -1,        5,       0,       0],
    residualModel=2,
    Rd=1.03,
    qD=1520540217.5,
    zeta0=1.94e-10,
    Gamma=0.0496,
    gamma=1.239,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsIsoButane(
    diluteLead=2.1357e-08,
    a=[
      0.53583008,        0;
      -0.4562963,        1;
      0.049911282,        2],
    diluteModel=2,
    sigma=0.46445,
    epsilon=307.55,
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
    residualTred=407.817,
    residualDMred=3860,
    dp=[
      0.000103511763411,        2,        0,        0,        1;
      -0.000312670896234,        2,        1,        0,        1;
      0.000145253750239,        2,        2,        0,        1;
      -0.000210649894193,        3,        0,        0,        1;
      0.000386269696509,        3,        1,        0,        1;
      -0.000214963015527,        3,        2,        0,        1;
      0.00011258036092,        4,        0,        0,        1;
      -0.000223242033154,        4,        1,        0,        1;
      0.000119114788598,        4,        2,        0,        1;
      -1.819097459e-05,        5,        0,        0,        1;
      3.60438957232e-05,        5,        1,        0,        1;
      -2.1396018405e-05,        5,        2,        0,        1],
    bl=[
      0.0019403760699,        1,        0],
    b0n=[
      2.33859774637,        0;
      2.352551508384381,        -0.5],
    b0d=[
      1,        0],
    residualModel=2  );

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsIsoButane(
    Tc=407.81,
    coeffs=[
      -0.01639,        2.102;
      0.06121,        1.304]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsIsoButane(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -48.02915589537987,        1.082;
      43.34653680580028,        1.108;
      -1.4421317283854331,        1.463;
      -3.1322275225078413,        4.045;
      5.203481182010376,        13.157;
      -6.173022897817098,        14.042],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      2.0418147224188545,        0.356;
      0.4363922893974425,        0.824;
      1.915261424521202,        3.142;
      -2.1807762762122045,        3.696;
      1.068664850362356,        6.863;
      -6.816247938174933,        18.441],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -2.8656855559386294,        0.37;
      0.7330458189287201,        0.502;
      -4.254613288675131,        1.021;
      2.9956235180226516,        2.003;
      -5.671641417558254,        3.403;
      0.14361022568133902,        10.717])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Buecker-JPCRD-2006B</p>
<p>Viscosity: Vogel-IJT-2000</p>
<p>Conductivity: Perkins-JCED-2002-Isobutane</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end IsoButane;

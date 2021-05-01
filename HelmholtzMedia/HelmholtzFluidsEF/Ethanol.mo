within HelmholtzMedia.HelmholtzFluidsEF;
package Ethanol "Ethanol"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="ethanol" "short name",
  final fluidConstants={fluidConstantsEthanol},
  final helmholtzCoefficients=helmholtzCoefficientsEthanol,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsEthanol,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsEthanol,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsEthanol,
  final ancillaryCoefficients=ancillaryCoefficientsEthanol,
  final fluidLimits=fluidLimitsEthanol,
  final refSubstance=ReferenceSubstance.None,
  final referenceHelmholtzCoeff = helmholtzCoefficients,
  final referenceConstants =  fluidConstants[1],
  Density(min=fluidLimitsEthanol.DMIN, max=fluidLimitsEthanol.DMAX, start=fluidConstantsEthanol.molarMass/fluidConstantsEthanol.criticalMolarVolume),
  Temperature(min=fluidLimitsEthanol.TMIN, max=fluidLimitsEthanol.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsEthanol.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsEthanol.HMIN, max=fluidLimitsEthanol.HMAX, start=(fluidLimitsEthanol.HMIN+fluidLimitsEthanol.HMAX)/2),
  SpecificEntropy(min=fluidLimitsEthanol.SMIN, max=fluidLimitsEthanol.SMAX, start=(fluidLimitsEthanol.SMIN+fluidLimitsEthanol.SMAX)/2));

  final constant FluidConstants
  fluidConstantsEthanol(
    casRegistryNumber="64-17-5",
    molarMass=0.04606844,
    hasCriticalData=true,
       criticalTemperature=514.71,
       criticalPressure=6268000,
       criticalMolarVolume=0.00016863406408094435,
       //HCRIT0=758920.7399462897,//CoolProp
       HCRIT0=1.16006e6,//EOS calculation
       //SCRIT0=1680.6027547650012,//CoolProp
       SCRIT0=3324.23,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=1.6909,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=true,
    hasAccurateConductivityData=true,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.644,
    triplePointTemperature=159.10000000000002,
    triplePointPressure=0.0007353928225172699,
    normalBoilingPoint=351.39,
    meltingPoint=159.10000000000002) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsEthanol(
    TMIN=fluidConstantsEthanol.triplePointTemperature,
    TMAX=650,
    DMIN=Modelica.Constants.small,
    //DMAX=893.72,//RefProp, For Dillon 2004 EOS
    DMAX=1000.54,
    PMIN=Modelica.Constants.small,
    PMAX=280000000,
    HMIN=-3e4,
    HMAX=1.887737e6,
    SMIN=-426,
    SMAX=30233.2) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsEthanol(
    idealLead={-12.7531, 9.39094},
    idealLog=[
      3.43069,         1.],
    idealEinstein=[
      2.14326,        -0.816771;
      5.09206,        -2.59175;
      6.60138,        -3.80408;
      5.70777,        -8.58736],
    idealIIRoffset={0, 0},
    idealNBPoffset={9.10869959576363, -4.32013218872146},
    residualPoly=[
      0.058200796,    1,    4;
      0.94391227,    1.04,    1;
      -0.80941908,    2.72,    1;
      0.55359038,    1.174,    2;
      -1.4269032,    1.329,    2;
      0.13448717,    0.195,    3],
    residualBwr=[
      0.42671978,    2.43,    1,    1;
      -1.1700261,    1.274,    1,    1;
      -0.92405872,    4.16,    1,    2;
      0.34891808,    3.3,    3,    1;
      -0.9132772,    4.177,    3,    2;
      0.022629481,    2.5,    2,    1;
      -0.15513423,    0.81,    2,    2;
      0.21055146,    2.02,    6,    1;
      -0.2199769,    1.606,    6,    1;
      -0.0065857238,    0.86,    8,    1],
    residualGauss=[
      0.75564749,    2.5,    1,    2,    2,    -1.075,    -1.207,    1.194,    0.779;
      0.1069411,    3.72,    1,    2,    2,    -0.463,    -0.0895,    1.986,    0.805;
      -0.069533844,    1.19,    2,    2,    2,    -0.876,    -0.581,    1.583,    1.869;
      -0.24947395,    3.25,    3,    2,    2,    -1.108,    -0.947,    0.756,    0.694;
      0.027177891,    3,    3,    2,    2,    -0.741,    -2.356,    0.495,    1.312;
      -0.0009053953,    2,    2,    2,    2,    -4.032,    -27.01,    1.002,    2.054;
      -0.12310953,    2,    2,    2,    2,    -2.453,    -4.542,    1.077,    0.441;
      -0.08977971,    1,    2,    2,    2,    -2.3,    -1.287,    1.493,    0.793;
      -0.39512601,    1,    1,    2,    2,    -3.143,    -3.09,    1.542,    0.313])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsEthanol(
    diluteTred=514.71,
    an=[
      -0.00209575,        0;
      0.0199045,        1;
      -0.053964,        2;
      0.0821223,        3;
      -0.00198864,        4;
      -0.000495513,        5],
    ad=[
      0.17223,        0;
      -0.078273,        1;
      1,        2],
    diluteModel=2,
    residualTred=514.71,
    residualDred=273.186,
    b=[
      0.0267222,        0,        1,       0,       0;
      0.0177166,        -1,        1,       0,       0;
      0.148279,        0,        2,       0,       0;
      -0.0893088,        -1,        2,       0,       0;
      -0.130429,        0,        3,       0,       0;
      0.0684664,        -1,        3,       0,       0;
      0.0346232,        0,        4,       0,       0;
      -0.0145702,        -1,        4,       0,       0;
      -0.00244293,        0,        5,       0,       0;
      0.000809189,        -1,        5,       0,       0],
    residualModel=2,
    Rd=1.02,
    qD=1880000000.0,
    zeta0=1.64296e-10,
    Gamma=0.05885,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsEthanol(
    a=[
      -1.03116e-06,        0;
      3.48379e-08,        1;
      -6.50264e-12,        2],
    diluteModel=4,
    sigma=0.453,
    epsilon=362.6,
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
    residualTred=513.9,
    residualDMred=5991,
    dp=[
      0.000131194057,        2,        0,        0,        1;
      -0.000382240694,        2,        1,        0,        1;
      -8.05700894e-05,        3,        0,        0,        1;
      0.000153811778,        3,        1,        0,        1;
      -0.000110578307,        3,        2,        0,        1],
    bl=[
      0.0237222995,        1,        0],
    b0n=[
      -3.38264465,        0;
      12.7568864,        -0.5],
    b0d=[
      1,        0],
    residualModel=2  );

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsEthanol(
    Tc=513.9,
    coeffs=[
      0.05,        0.952]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsEthanol(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -7.689152382102059,        0.971;
      -6.126637668761524,        2.322;
      6.6239961045380715,        3.072;
      -7.827481023390803,        3.934;
      3.1386332149218172,        4.465;
      -6.712235308208619,        19.972],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      7.824518623386008,        0.596;
      -338.93732001583646,        1.495;
      368.3422016038343,        1.561;
      -90.14206962630433,        2.737;
      80.35347134933373,        3.606;
      -26.00710239571597,        4.943],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -4.698337259111072,        0.443;
      -10.953380258011986,        2.304;
      12.92351305172882,        4.146;
      -1017.0017776259273,        11.027;
      1604.552160868234,        12.113;
      -1439.9265562459323,        17.485])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Schroeder-JPCRD-2014</p>
<p>Viscosity: Kiselev-IECR-2005</p>
<p>Conductivity: Assael-JPCRD-2013-Ethanol</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end Ethanol;

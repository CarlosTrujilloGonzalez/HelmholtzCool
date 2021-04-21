within HelmholtzMedia.HelmholtzFluids;
package Butane "Butane"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="butane" "short name",
  final fluidConstants={fluidConstantsButane},
  final helmholtzCoefficients=helmholtzCoefficientsButane,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsButane,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsButane,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsButane,
  final ancillaryCoefficients=ancillaryCoefficientsButane,
  final fluidLimits=fluidLimitsButane,
  Density(min=fluidLimitsButane.DMIN, max=fluidLimitsButane.DMAX, start=fluidConstantsButane.molarMass/fluidConstantsButane.criticalMolarVolume),
  Temperature(min=fluidLimitsButane.TMIN, max=fluidLimitsButane.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsButane.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsButane.HMIN, max=fluidLimitsButane.HMAX, start=(fluidLimitsButane.HMIN+fluidLimitsButane.HMAX)/2),
  SpecificEntropy(min=fluidLimitsButane.SMIN, max=fluidLimitsButane.SMAX, start=(fluidLimitsButane.SMIN+fluidLimitsButane.SMAX)/2));

  final constant FluidConstants
  fluidConstantsButane(
    casRegistryNumber="106-97-8",
    molarMass=0.0581222,
    hasCriticalData=true,
       criticalTemperature=425.125,
       criticalPressure=3796000.0,
       criticalMolarVolume=0.0002549219298245614,
       //HCRIT0=693907.4467701562,//CoolProp
       HCRIT0=691656,//EOS calcuolation
       //SCRIT0=2363.0910733722762,//CoolProp
       SCRIT0=2357.79,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=0.05,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=true,
    hasAccurateConductivityData=true,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.200810094644,
    triplePointTemperature=134.895,
    triplePointPressure=0.6656582208078881,
    normalBoilingPoint=272.66,
    meltingPoint=134.895) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsButane(
    TMIN=fluidConstantsButane.triplePointTemperature,
    TMAX=575,
    DMIN=Modelica.Constants.small,
    //DMAX=805.57,//from RefProp
    DMAX=793.86,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=200000000,//In CoolProp it is indicated as 120 bars
    HMIN=-1.0e5,
    HMAX=+1.23e6,
    SMIN=-720.27,
    SMAX=8100) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsButane(
    idealLead={12.54882924-17.9737888338978, -5.46976878+10.3892639083242},
    idealLog=[
      3.24680487,         1.],
    idealEinstein=[
      5.54913289,        -0.774840445;
      11.4648996,        -3.340602552;
      7.59987584,        -4.970513096;
      9.66033239,        -9.975553778],
    idealASHRAEoffset={4.52843, -1.82199},
    idealIIRoffset={0, 0},
    idealNBPoffset={6.96151, -3.27002},
    residualPoly=[
      2.5536998241635,    0.5,    1;
      -4.4585951806696,    1,    1;
      0.82425886369063,    1.5,    1;
      0.11215007011442,    0,    2;
      -0.035910933680333,    0.5,    3;
      0.016790508518103,    0.5,    4;
      0.032734072508724,    0.75,    4],
    residualBwr=[
      0.95571232982005,    2,    1,    1;
      -1.0003385753419,    2.5,    1,    1;
      0.085581548803855,    2.5,    2,    1;
      -0.025147918369616,    1.5,    7,    1;
      -0.0015202958578918,    1,    8,    1;
      0.004706068232642,    1.5,    8,    1;
      -0.097845414174006,    4,    1,    2;
      -0.04831790415876,    7,    2,    2;
      0.17841271865468,    3,    3,    2;
      0.018173836739334,    7,    3,    2;
      -0.11399068074953,    3,    4,    2;
      0.019329896666669,    1,    5,    2;
      0.001157587740101,    6,    5,    2;
      0.00015253808698116,    0,    10,    2;
      -0.043688558458471,    6,    2,    3;
      -0.0082403190629989,    13,    6,    3],
    residualGauss=[
      -0.028390056949441,    2,    1,    2,    2,    -10,    -150,    1.16,    0.85;
      0.0014904666224681,    0,    2,    2,    2,    -10,    -200,    1.13,    1])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsButane(
    diluteTred=425.16,
    an=[
      0.00162676,        0;
      0.000975703,        1;
      0.0289887,        2],
    ad=[
      1.0,        0],
    diluteModel=2,
    residualTred=425.16,
    residualDred=227.8,
    b=[
      -0.0304337,        0,        1,       0,       0;
      0.16582,        0,        2,       0,       0;
      -0.148144,        0,        3,       0,       0;
      0.05255,        0,        4,       0,       0;
      -0.00629367,        0,        5,       0,       0;
      0.0418357,        -1,        1,       0,       0;
      -0.147163,        -1,        2,       0,       0;
      0.133542,        -1,        3,       0,       0;
      -0.0485489,        -1,        4,       0,       0;
      0.00644307,        -1,        5,       0,       0],
    residualModel=2,
    Rd=1.03,
    qD=1142400182.0,
    zeta0=1.94e-10,
    Gamma=0.0496,
    gamma=1.239,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsButane(
    sigma=0.57335,
    epsilon=280.51,
    diluteLead=2.1357e-08,
    a=[
      0.17067154,        0;
      -0.48879666,        1;
      0.039038856,        2],
    diluteModel=2,
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
    residualTred=425.125,
    residualDMred=3920,
    dp=[
      -5.47737770846e-05,        2,        0,        0,        1;
      5.80898623034e-05,        2,        1,        0,        1;
      3.52658446259e-05,        3,        0,        0,        1;
      -3.96682203832e-05,        3,        1,        0,        1;
      -1.83729542151e-06,        4,        0,        0,        1;
      0.0,        4,        1,        0,        1;
      -8.33262985358e-07,        5,        0,        0,        1;
      1.93837020663e-06,        5,        1,        0,        1],
    bl=[
      0.000188075903903,        1,        0],
    b0n=[
      2.30873963359,        0;
      2.0340403725423957,        -0.5],
    b0d=[
      1,        0],
    residualModel=2  );

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsButane(
    Tc=425.125,
    coeffs=[
      0.05138,        1.209]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsButane(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      0.06986482880463143,        0.743;
      -6.689091326409199,        0.984;
      4.774874567188075,        1.886;
      -5.7054710938841655,        2.16;
      1.8437119133933968,        3.286;
      -3.735372218319482,        4.231],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      7.6544950329552,        0.501;
      -16.928503641708495,        0.742;
      14.176327512939299,        0.917;
      -2.3511736019127136,        1.387;
      5.431931351600508,        9.328;
      -13.286388570143172,        12.623],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -3.756767939636941,        0.448;
      -2.819084986331516,        1.717;
      2.3817493893256763,        4.443;
      -27.835034497609627,        7.472;
      409.95394459399324,        13.095;
      -539.2138907428523,        14.725])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Buecker-JPCRD-2006B</p>
<p>Viscosity: Vogel-HTHP-1999</p>
<p>Conductivity: Perkins-JCED-2002-nButane</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end Butane;

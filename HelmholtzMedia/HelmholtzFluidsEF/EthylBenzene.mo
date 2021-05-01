within HelmholtzMedia.HelmholtzFluidsEF;
package EthylBenzene "EthylBenzene"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="ethylbenzene" "short name",
  final fluidConstants={fluidConstantsEthylBenzene},
  final helmholtzCoefficients=helmholtzCoefficientsEthylBenzene,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsEthylBenzene,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsEthylBenzene,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsEthylBenzene,
  final ancillaryCoefficients=ancillaryCoefficientsEthylBenzene,
  final fluidLimits=fluidLimitsEthylBenzene,
  final refSubstance=ReferenceSubstance.Propane,
  final referenceHelmholtzCoeff = Transport.ECSreferences.helmholtzCoefficientsPropane,
  final referenceConstants =  Transport.ECSreferences.fluidConstantsPropane,
  final referenceViscosityCoeff = Transport.ECSreferences.dynamicViscosityCoefficientsPropane,
  final referenceConductivityCoeff = Transport.ECSreferences.thermalConductivityCoefficientsPropane,
  Density(min=fluidLimitsEthylBenzene.DMIN, max=fluidLimitsEthylBenzene.DMAX, start=fluidConstantsEthylBenzene.molarMass/fluidConstantsEthylBenzene.criticalMolarVolume),
  Temperature(min=fluidLimitsEthylBenzene.TMIN, max=fluidLimitsEthylBenzene.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsEthylBenzene.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsEthylBenzene.HMIN, max=fluidLimitsEthylBenzene.HMAX, start=(fluidLimitsEthylBenzene.HMIN+fluidLimitsEthylBenzene.HMAX)/2),
  SpecificEntropy(min=fluidLimitsEthylBenzene.SMIN, max=fluidLimitsEthylBenzene.SMAX, start=(fluidLimitsEthylBenzene.SMIN+fluidLimitsEthylBenzene.SMAX)/2));

  final constant FluidConstants
  fluidConstantsEthylBenzene(
    casRegistryNumber="100-41-4",
    molarMass=0.106165,
    hasCriticalData=true,
       criticalTemperature=617.12,
       criticalPressure=3622400,
       criticalMolarVolume=0.0003648282242788805,
       //HCRIT0=588559.3770964127,//CoolProp
       HCRIT0=588397,//EOS calculation
       //SCRIT0=1121.13631132597,//CoolProp
       SCRIT0=1120.89,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=0.4,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=true,
    hasAccurateConductivityData=true,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.304,
    triplePointTemperature=178.20000000000002,
    triplePointPressure=0.00400362117221462,
    normalBoilingPoint=409.3,
    meltingPoint=178.20000000000002) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsEthylBenzene(
    TMIN=fluidConstantsEthylBenzene.triplePointTemperature,
    TMAX=700,
    DMIN=Modelica.Constants.small,
    DMAX=990.2,
    PMIN=Modelica.Constants.small,
    PMAX=60000000,
    HMIN=-4.1e5,
    HMAX=947389,
    SMIN=-1.47921e3,
    SMAX=12797) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsEthylBenzene(
    idealLead={5.70409, -0.52414353},
    idealLog=[
      4.2557889,         1.],
    idealEinstein=[
      9.7329909,        -0.9479517759917034;
      11.201832,        -7.16230230749287;
      25.440749,        -2.710980036297641],
    idealIIRoffset={-22.4748,-2.73547},
    idealNBPoffset={0, 0},
    residualPoly=[
      0.0018109418,    1,    5;
      -0.076824284,    1,    1;
      0.041823789,    0.92,    4;
      1.5059649,    0.27,    1;
      -2.4122441,    0.962,    1;
      -0.47788846,    1.033,    2;
      0.18814732,    0.513,    3],
    residualBwr=[
      -1.0657412,    2.31,    1,    2;
      -0.20797007,    3.21,    3,    2;
      1.1222031,    1.26,    2,    1;
      -0.99300799,    2.29,    2,    2;
      -0.027300984,    1,    7,    1],
    residualGauss=[
      1.3757894,    0.6,    1,    2,    2,    -1.178,    -2.437,    1.2667,    0.5494;
      -0.44477155,    3.6,    1,    2,    2,    -1.07,    -1.488,    0.4237,    0.7235;
      -0.07769742,    2.1,    3,    2,    2,    -1.775,    -4,    0.8573,    0.493;
      -2.16719,    0.5,    3,    2,    2,    -15.45,    -418.6,    1.15,    0.8566])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsEthylBenzene(
    diluteTred=617.12,
    an=[
      -0.00110708,        0;
      0.0108026,        1;
      -0.0289015,        2;
      0.0419227,        3;
      0.0209133,        4;
      -0.00401492,        5],
    ad=[
      0.259475,        0;
      -0.343879,        1;
      1,        2],
    diluteModel=2,
    residualTred=617.12,
    residualDred=291.0,
    b=[
      -0.0497837,        0,        1,       0,       0;
      0.0663073,        -1,        1,       0,       0;
      0.106739,        0,        2,       0,       0;
      -0.146279,        -1,        2,       0,       0;
      -0.0685137,        0,        3,       0,       0;
      0.12143899999999999,        -1,        3,       0,       0;
      0.0226133,        0,        4,       0,       0;
      -0.0462245,        -1,        4,       0,       0;
      -0.0027945500000000002,        0,        5,       0,       0;
      0.00658554,        -1,        5,       0,       0],
    residualModel=2,
    Rd=1.03,
    qD=1416430594.9008498,
    zeta0=2.35e-10,
    Gamma=0.056,
    gamma=1.239,
    criticalModel=2);

  /*final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsEthylBenzene(
    corrG=110,
    coefG={1.6833E-06,3.9831E-01,3.6645E+02,2.375E+04,0.0},
    diluteModel=10,
    corrL=30,
    coefL={-4.87727E+01,2.25518E+03,6.09995E+00,-1.06016E-05,2.000E+00},
    residualModel=10);*/
    
  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsEthylBenzene(
    diluteModel=1,
    initialModel=1,
    residualModel=1);

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsEthylBenzene(
    Tc=617.12,
    coeffs=[
      0.0638,        1.22]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsEthylBenzene(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -10.470797927331965,        1.034;
      13.630609834199861,        1.41;
      -10.464804307489011,        1.581;
      -3.597964571513027,        4.148;
      -0.24883120010409457,        6.154;
      -2.1658021554100957,        15.215],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      4.915675810263367,        0.464;
      -4.4212458698552295,        0.709;
      5.72675775026962,        1.422;
      -3.746340117826641,        1.801;
      4.221240347308843,        8.327;
      -7.214708107153519,        11.454],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -3.0745260331510194,        0.426;
      -0.9359433157855367,        0.545;
      -10.417112433984668,        1.641;
      25.449706975048258,        2.034;
      -19.993854217365445,        2.35;
      -2.653264944314633,        5.977])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Zhou-JPCRD-2012</p>
<p>Viscosity: Meng et alt. JPCRD-2017</p>
<p>Conductivity: Mylona-JPCRD-2014-xylenes</p>
<p>Surface tension: Mulero-JPCRD-2014</p>
</body>
  </html>"));
end EthylBenzene;

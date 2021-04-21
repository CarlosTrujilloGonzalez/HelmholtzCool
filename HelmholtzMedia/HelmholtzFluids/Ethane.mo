within HelmholtzMedia.HelmholtzFluids;
package Ethane "Ethane"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="ethane" "short name",
  final fluidConstants={fluidConstantsEthane},
  final helmholtzCoefficients=helmholtzCoefficientsEthane,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsEthane,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsEthane,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsEthane,
  final ancillaryCoefficients=ancillaryCoefficientsEthane,
  final fluidLimits=fluidLimitsEthane,
  Density(min=fluidLimitsEthane.DMIN, max=fluidLimitsEthane.DMAX, start=fluidConstantsEthane.molarMass/fluidConstantsEthane.criticalMolarVolume),
  Temperature(min=fluidLimitsEthane.TMIN, max=fluidLimitsEthane.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsEthane.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsEthane.HMIN, max=fluidLimitsEthane.HMAX, start=(fluidLimitsEthane.HMIN+fluidLimitsEthane.HMAX)/2),
  SpecificEntropy(min=fluidLimitsEthane.SMIN, max=fluidLimitsEthane.SMAX, start=(fluidLimitsEthane.SMIN+fluidLimitsEthane.SMAX)/2));

  final constant FluidConstants
  fluidConstantsEthane(
    casRegistryNumber="74-84-0",
    molarMass=0.03006904,
    hasCriticalData=true,
       criticalTemperature=305.322,
       criticalPressure=4872200,
       criticalMolarVolume=0.0001458387816423424,
       //HCRIT0=439079.3598850674,//CoolProp
       HCRIT0=-235155,//EOS calculation
       //SCRIT0=1690.3298840449245,//CoolProp
       SCRIT0=-1727.38,//EOS calculation
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
       acentricFactor=0.099,
    triplePointTemperature=90.368,
    triplePointPressure=1.142107639085233,
    normalBoilingPoint=184.569,
    meltingPoint=90.368) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsEthane(
    TMIN=fluidConstantsEthane.triplePointTemperature,
    TMAX=675,
    DMIN=Modelica.Constants.small,
    //DMAX=674.12,//RefProp
    DMAX=797.711,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=900000000,
    HMIN=-9.0e5,
    HMAX=1.87e6,
    SMIN=-6070,
    SMAX=3442) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsEthane(
    idealLead={9.212802589, -4.68224855},
    idealLog=[
      3.003039265,         1.],
    idealEinstein=[
      1.117433359,        -1.409105233;
      3.467773215,        -4.009917071;
      6.94194464,        -6.596709834;
      5.970850948,        -13.97981027],
    idealIIRoffset={-12.0654, 7.35909},
    idealNBPoffset={-12.3066235581354, 7.93255065878148},
    residualPoly=[
      0.83440745735241,    0.25,    1;
      -1.4287360607171,    1,    1;
      0.34430242210927,    0.25,    2;
      -0.42096677920265,    0.75,    2;
      0.012094500886549,    0.75,    4],
    residualBwr=[
      -0.57976201597341,    2,    1,    1;
      -0.033127037870838,    4.25,    1,    1;
      -0.1175165489413,    0.75,    2,    1;
      -0.11160957833067,    2.25,    2,    1;
      0.062181592654406,    3,    3,    1;
      0.098481795434443,    1,    6,    1;
      -0.098268582682358,    1.25,    6,    1;
      -0.00023977831007049,    2.75,    7,    1;
      0.00069885663328821,    1,    9,    1;
      1.9665987803305e-05,    2,    10,    1;
      -0.014586152207928,    2.5,    2,    2;
      0.046354100536781,    5.5,    4,    2;
      0.0060764622180645,    7,    4,    2;
      -0.0026447330147828,    0.5,    5,    2;
      -0.042931872689904,    5.5,    5,    2;
      0.0029987786517263,    2.5,    6,    2;
      0.005291933517501,    4,    8,    2;
      -0.0010383897798198,    2,    9,    2;
      -0.054260348214694,    10,    2,    3;
      -0.21959362918493,    16,    3,    3;
      0.35362456650354,    18,    3,    3;
      -0.12477390173714,    20,    3,    3;
      0.18425693591517,    14,    4,    3;
      -0.16192256436754,    18,    4,    3;
      -0.082770876149064,    12,    5,    3;
      0.050160758096437,    19,    5,    3;
      0.0093614326336655,    7,    6,    3;
      -0.00027839186242864,    15,    11,    3;
      2.3560274071481e-05,    9,    14,    3;
      0.0039238329738527,    26,    3,    4;
      -0.00076488325813618,    28,    3,    4;
      -0.004994430444073,    28,    4,    4;
      0.0018593386407186,    22,    8,    4;
      -0.00061404353331199,    13,    10,    4],
    residualGauss=[
      -0.0023312179367924,    0,    1,    2,    2,    -15,    -150,    1.05,    1;
      0.002930104790876,    3,    1,    2,    2,    -15,    -150,    1.05,    1;
      -0.00026912472842883,    3,    3,    2,    2,    -15,    -150,    1.05,    1;
      184.13834111814,    0,    3,    2,    2,    -20,    -275,    1.22,    1;
      -10.397127984854,    3,    2,    2,    2,    -20,    -400,    1.16,    1])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsEthane(
    diluteModel=1,
    residualTred=305.33,
    residualDred=206.5809,
    b=[
      0.0042448708279092,        0,        1,       0,       0;
      0.012149218819710001,        0,        2,       0,       0;
      -0.00011755611350154,        0,        3,       0,       0;
      -0.00034524130817994,        0,        4,       0,       0;
      0.0009666869231454,        0,        5,       0,       0;
      0.010536403039518,        1.5,        1,       0,       0;
      -0.0033184300792206,        1,        3,       0,       0],
    residualModel=2,
    Rd=1.03,
    qD=1834862385.3,
    zeta0=1.9e-10,
    Gamma=0.0563,
    gamma=1.242,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsEthane(
    diluteModel=1,
    sigma=0.43682,
    epsilon=245.0,
    residualModel=1
);

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsEthane(
    Tc=305.322,
    coeffs=[
      0.07602,        1.32;
      -0.02912,        1.676]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsEthane(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      9.344483558228339,        0.871;
      -14.812636376983514,        0.902;
      -0.6873077210086483,        1.663;
      0.7942400572322573,        2.045;
      -2.447274904672986,        3.946;
      0.04047591478430641,        14.704],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      0.2029526716447543,        0.211;
      2.027464725614132,        0.408;
      0.4378976432411991,        1.789;
      -13.592018000960584,        10.003;
      57.55031435474073,        12.669;
      -88.68904612138073,        16.309],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -2.6749170682059686,        0.385;
      2.030707929009753,        0.775;
      -6.8230765701730345,        1.013;
      4.330369494473089,        1.533;
      -2.442998212709984,        2.476;
      -2.2189277777818948,        4.435])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Buecker-JPCRD-2006</p>
<p>Viscosity: Friend-JPCRD-1991</p>
<p>Conductivity: Friend-JPCRD-1991</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end Ethane;

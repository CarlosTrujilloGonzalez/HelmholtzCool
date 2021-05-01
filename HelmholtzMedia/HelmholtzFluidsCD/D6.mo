within HelmholtzMedia.HelmholtzFluidsCD;
package D6 "D6"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="d6" "short name",
  final fluidConstants={fluidConstantsD6},
  final helmholtzCoefficients=helmholtzCoefficientsD6,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsD6,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsD6,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsD6,
  final ancillaryCoefficients=ancillaryCoefficientsD6,
  final fluidLimits=fluidLimitsD6,
  final refSubstance=ReferenceSubstance.Nitrogen,
  final referenceHelmholtzCoeff = Transport.ECSreferences.helmholtzCoefficientsNitrogen,
  final referenceConstants =  Transport.ECSreferences.fluidConstantsNitrogen,
  final referenceViscosityCoeff = Transport.ECSreferences.dynamicViscosityCoefficientsNitrogen,
  final referenceConductivityCoeff = Transport.ECSreferences.thermalConductivityCoefficientsNitrogen,
  Density(min=fluidLimitsD6.DMIN, max=fluidLimitsD6.DMAX, start=fluidConstantsD6.molarMass/fluidConstantsD6.criticalMolarVolume),
  Temperature(min=fluidLimitsD6.TMIN, max=fluidLimitsD6.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsD6.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsD6.HMIN, max=fluidLimitsD6.HMAX, start=(fluidLimitsD6.HMIN+fluidLimitsD6.HMAX)/2),
  SpecificEntropy(min=fluidLimitsD6.SMIN, max=fluidLimitsD6.SMAX, start=(fluidLimitsD6.SMIN+fluidLimitsD6.SMAX)/2));

  final constant FluidConstants
  fluidConstantsD6(
    casRegistryNumber="540-97-6",
    molarMass=0.444924,
    hasCriticalData=true,
       criticalTemperature=645.78,
       criticalPressure=961000,
       criticalMolarVolume=0.0015941626919655373,
       //HCRIT0=297520.590453753,//CoolProp
       HCRIT0=3.69998e6,//EOS calculation
       //SCRIT0=506.3875655372465,//CoolProp
       SCRIT0=7853.35,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=0.0,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=false,
    hasAccurateConductivityData=false,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.736,
    triplePointTemperature=270.2,
    triplePointPressure=0.1597529988242164,
    normalBoilingPoint=518.11,
    meltingPoint=270.2) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsD6(
    TMIN=fluidConstantsD6.triplePointTemperature,
    TMAX=673,
    DMIN=Modelica.Constants.small,
    DMAX=999.3,//RefProp
    //DMAX=1053.31,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=30000000,
    HMIN=2.9644e6,
    HMAX=3.80115e6,
    SMIN=6187,
    SMAX=10662.4) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsD6(
    idealLead={-7.938561730464921, 8.452340963237452},
    idealLog=[
      -1,         1.],
    idealSinh=[
      118.0111016069331,    2.775093685],
    idealCosh=[
      82.5909330141469,   1.218371582],  
    //idealNBPoffset={16.2776881308826, -9.86112982952628},
    idealCpConst=56.37158920013201,
    idealIIRoffset={279.906, -229.441},
    idealNBPoffset={393.162, -281.953},
    residualPoly=[
      1.69156186,    0.25,    1;
      -3.37962568,    1.125,    1;
      0.38609039,    1.5,    1;
      0.064598995,    1.375,    2;
      0.10589012,    0.25,    3;
      4.5456825e-05,    0.875,    7],
    residualBwr=[
      0.74169279,    0.625,    2,    1;
      -0.088102648,    1.75,    5,    1;
      -0.17373336,    3.625,    1,    2;
      -0.10951368,    3.625,    4,    2;
      -0.062695695,    14.5,    3,    3;
      0.037459986,    12,    4,    3])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsD6(
    ai={0.00132},
    corrG=121,
    coefG={1.5497E-05,5.1101E-06,5.9594E-08,-2.2814E-11,0.0},
    diluteModel=9,
    nistCoeff={1.38744,0.127827},
    corrL=50,
    coefL={4.10827E-01,-2.28271E-03,7.00886E-06,-1.06941E-08,6.15152E-12},
    residualModel=9,
    qD=8.547E+08,
    zeta0=3.41e-10,
    Gamma=0.072,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsD6(
    epsilon=512.8,
    sigma=0.945,
    Fc=1.0,
    corrG=111,
    coefG={3.464E-07,1.3478E-08,3.4234E-12,-2.1729E-15,0.0},
    diluteModel=3,
    initialModel=0,
    nistCoeff={1.06991,0.00448715},
    corrL=30,
    coefL={-1.3072E+01,1.6103E+03,5.78748E-01,-7.66708E-06,2.000E+00},
    residualModel=9);

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsD6(
    Tc=645.78,
    coeffs=[
      0.05105,        1.594]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsD6(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      0.0009840543696606977,        0.023;
      -41.57124463279652,        1.048;
      33.17839559625214,        1.073;
      -221.16595834771732,        4.527;
      368.2016194959781,        4.823;
      -159.62000149415917,        5.211],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      41.50050216018366,        0.59;
      -198.81152403352948,        0.719;
      161.74986511225353,        0.755;
      -2.8794147964708507,        3.132;
      15327.689037983815,        14.519;
      -19023.670087608214,        14.971],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -15.776270974992267,        0.522;
      13.699167960267655,        0.588;
      -7.138110844583917,        1.175;
      -2782.2625154428233,        9.309;
      5504.275783042545,        10.264;
      -5468.11384054501,        13.23])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Colonna-FPE-2008</p>
<p>Liquid visc. and th.cond.: ECS plus correlations</p>
<p>Surface tension: Mulero-JPCRD-2014</p>
</body>
  </html>"));
end D6;

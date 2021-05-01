within HelmholtzMedia.HelmholtzFluidsPQ;
package Propylene "Propylene"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="propylene" "short name",
  final fluidConstants={fluidConstantsPropylene},
  final helmholtzCoefficients=helmholtzCoefficientsPropylene,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsPropylene,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsPropylene,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsPropylene,
  final ancillaryCoefficients=ancillaryCoefficientsPropylene,
  final fluidLimits=fluidLimitsPropylene,
  final refSubstance=ReferenceSubstance.Propane,
  final referenceHelmholtzCoeff = Transport.ECSreferences.helmholtzCoefficientsPropane,
  final referenceConstants =  Transport.ECSreferences.fluidConstantsPropane,
  final referenceViscosityCoeff = Transport.ECSreferences.dynamicViscosityCoefficientsPropane,
  final referenceConductivityCoeff = Transport.ECSreferences.thermalConductivityCoefficientsPropane,
  Density(min=fluidLimitsPropylene.DMIN, max=fluidLimitsPropylene.DMAX, start=fluidConstantsPropylene.molarMass/fluidConstantsPropylene.criticalMolarVolume),
  Temperature(min=fluidLimitsPropylene.TMIN, max=fluidLimitsPropylene.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsPropylene.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsPropylene.HMIN, max=fluidLimitsPropylene.HMAX, start=(fluidLimitsPropylene.HMIN+fluidLimitsPropylene.HMAX)/2),
  SpecificEntropy(min=fluidLimitsPropylene.SMIN, max=fluidLimitsPropylene.SMAX, start=(fluidLimitsPropylene.SMIN+fluidLimitsPropylene.SMAX)/2));

  final constant FluidConstants
  fluidConstantsPropylene(
    casRegistryNumber="115-07-1",
    molarMass=0.04207974,
    hasCriticalData=true,
       criticalTemperature=364.211,
       criticalPressure=4555000,
       criticalMolarVolume=0.0001832508704416346,
       //HCRIT0=531177.5173642037,//CoolProp
       HCRIT0=531088,//EOS calculation
       //SCRIT0=1985.9437197170846,//CoolProp
       SCRIT0=1985.73,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=0.366,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=true,
    hasAccurateConductivityData=true,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.146,
    triplePointTemperature=87.953,
    triplePointPressure=0.0007469480313533406,
    normalBoilingPoint=225.531,
    meltingPoint=87.953) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsPropylene(
    TMIN=fluidConstantsPropylene.triplePointTemperature,
    TMAX=575,
    DMIN=Modelica.Constants.small,
    DMAX=972.0,//RefProp
    //DMAX=932.8,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=1000000000,
    HMIN=-2.0e5,
    HMAX=2.057e6,
    SMIN=-2811.41e3,
    SMAX=31488.7) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsPropylene(
    idealLead={4.9916462-10.1739741651451, -0.1709449+4.53493517654279},
    idealLog=[
      3,         1.],
    idealEinstein=[
      1.544,        -0.8895942187358427;
      4.013,        -2.671528317376466;
      8.923,        -5.304617378387802;
      6.02,        -11.85301926630442],
    idealIIRoffset={0, 0},
    idealNBPoffset={2.84436, -1.25211},
    residualPoly=[
      0.04341002,    1,    4;
      1.136592,    0.205,    1;
      -0.8528611,    0.56,    1;
      0.5216669,    0.676,    2;
      -1.382953,    1,    2;
      0.1214347,    0.5,    3],
    residualBwr=[
      -0.5984662,    1,    1,    1;
      -1.391883,    1.94,    1,    2;
      -1.008434,    2,    3,    2;
      0.1961249,    1,    2,    1;
      -0.360693,    2.66,    2,    2;
      -0.002407175,    0.83,    8,    1],
    residualGauss=[
      0.7432121,    1.6,    1,    2,    2,    -1.07,    -0.77,    1.21,    0.78;
      0.1475162,    2.5,    1,    2,    2,    -0.66,    -0.83,    1.08,    0.82;
      -0.02503391,    3,    2,    2,    2,    -1.2,    -0.607,    0.83,    1.94;
      -0.2734409,    2.5,    3,    2,    2,    -1.12,    -0.4,    0.56,    0.69;
      0.006378889,    2.72,    3,    2,    2,    -1.47,    -0.66,    1.22,    1.96;
      0.0150294,    4,    2,    2,    2,    -1.93,    -0.07,    1.81,    1.3;
      -0.03162971,    4,    1,    2,    2,    -3.3,    -3.1,    1.54,    0.38;
      -0.04107194,    1,    2,    2,    2,    -15.4,    -387,    1.12,    0.91;
      -1.190241,    4,    3,    2,    2,    -6,    -41,    1.4,    0.7])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsPropylene(
    ai={0.00109939,3.72539e-7},
    corrG=120,
    coefG={4.5373E-05,1.200,4.1583E+02,2.7572E+03,0.0},
    diluteModel=9,
    nistCoeff={1.3521,-0.123177},
    corrL=51,
    coefL={-4.4587E-02,2.2061E+01,-1.744E+00,1.5214E-03,-7.8162E-06},
    residualModel=9,
    criticalModel=0);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsPropylene(
    epsilon=298.9,
    sigma=0.4678,
    Fc=1.0,
    corrG=110,
    coefG={7.3873E-07,5.4213E-01,2.623E+02,-1.0851E+02,0.0},
    diluteModel=3,
    initialModel=0,
    nistCoeff={1.13546,-0.0232208,-0.0447703,0.0121815},
    corrL=30,
    coefL={-3.81962E+01,1.07235E+03,4.82892E+00,-2.48323E-05,2.000E+00},
    residualModel=9);

  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsPropylene(
    Tc=364.211,
    coeffs=[
      0.05268,        1.186]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsPropylene(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      -6.15754746767542,        0.985;
      0.8043847738472081,        1.914;
      -2.629218877933464,        3.354;
      -20.055797246021456,        8.871;
      23.93889034404838,        9.472;
      -5.927221357425409,        12.201],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      1.1500616940414559,        0.286;
      0.7037673936905474,        0.521;
      0.6950815609799416,        0.701;
      1.8850870474961088,        5.657;
      -2.1702211585216302,        6.864;
      2.21238242151199,        15.279],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -5.13562614673855,        0.42;
      4.2053374767917395,        0.56;
      -8.021462611933476,        1.051;
      4.971018368148577,        1.479;
      -4.664302402572978,        3.598;
      -1.7964631156271889,        16.862])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Lemmon-PROPYLENE-2013</p>
<p>Viscosity and thermal conductivity: ECS and T correlations with pressure correction</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end Propylene;

within HelmholtzMedia.HelmholtzFluidsR;
package R32 "R32"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="r32" "short name",
  final fluidConstants={fluidConstantsR32},
  final helmholtzCoefficients=helmholtzCoefficientsR32,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsR32,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsR32,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsR32,
  final ancillaryCoefficients=ancillaryCoefficientsR32,
  final fluidLimits=fluidLimitsR32,
  final refSubstance=ReferenceSubstance.Propane,
  final referenceHelmholtzCoeff = Transport.ECSreferences.helmholtzCoefficientsPropane,
  final referenceConstants =  Transport.ECSreferences.fluidConstantsPropane,
  final referenceViscosityCoeff = Transport.ECSreferences.dynamicViscosityCoefficientsPropane,
  final referenceConductivityCoeff = Transport.ECSreferences.thermalConductivityCoefficientsPropane,
  Density(min=fluidLimitsR32.DMIN, max=fluidLimitsR32.DMAX, start=fluidConstantsR32.molarMass/fluidConstantsR32.criticalMolarVolume),
  Temperature(min=fluidLimitsR32.TMIN, max=fluidLimitsR32.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsR32.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsR32.HMIN, max=fluidLimitsR32.HMAX, start=(fluidLimitsR32.HMIN+fluidLimitsR32.HMAX)/2),
  SpecificEntropy(min=fluidLimitsR32.SMIN, max=fluidLimitsR32.SMAX, start=(fluidLimitsR32.SMIN+fluidLimitsR32.SMAX)/2));

  final constant FluidConstants
  fluidConstantsR32(
    casRegistryNumber="75-10-5",
    molarMass=0.052024,
    hasCriticalData=true,
       criticalTemperature=351.255,
       criticalPressure=5782000,
       criticalMolarVolume=0.00012269811285149114,
       //HCRIT0=414197.91882792435,//CoolProp
       HCRIT0=414146,//EOS calculation
       //SCRIT0=1648.7578619226995,//CoolProp
       SCRIT0=1648.64,//EOS calculation
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=1.978,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=true,
    hasAccurateConductivityData=true,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.2769,
    triplePointTemperature=136.34,
    triplePointPressure=47.999893876059375,
    normalBoilingPoint=221.499,
    meltingPoint=136.34) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsR32(
    TMIN=fluidConstantsR32.triplePointTemperature,
    TMAX=435,
    DMIN=Modelica.Constants.small,
    DMAX=1429.3,//RefProp
    //DMAX=1474.32,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=70000000,
    HMIN=-19071.8,
    HMAX=690040,
    SMIN=-105.009,
    SMAX=25122.9) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsR32(
    idealLead={-8.258096, 6.353098},
    idealLog=[
      3.004486,         1.],
    idealEinstein=[
      1.160761,        -2.2718538;
      2.645151,        -11.914421;
      5.794987,        -5.1415638;
      1.129475,        -32.768217],
    idealASHRAEoffset={4.6189, -2.3732},
    idealIIRoffset={0, 0},
    idealNBPoffset={4.10768, -2.04127},
    residualPoly=[
      1.046634,    0.25,    1;
      -0.5451165,    1,    2;
      -0.002448595,    -0.25,    5;
      -0.04877002,    -1,    1;
      0.03520158,    2,    1;
      0.00162275,    2,    3;
      2.377225e-05,    0.75,    8;
      0.029149,    0.25,    4],
    residualBwr=[
      0.003386203,    18,    4,    4;
      -0.004202444,    26,    4,    3;
      0.0004782025,    -1,    8,    1;
      -0.005504323,    25,    3,    4;
      -0.02418396,    1.75,    5,    1;
      0.4209034,    4,    1,    2;
      -0.4616537,    5,    1,    2;
      -1.200513,    1,    3,    1;
      -2.59155,    1.5,    1,    1;
      -1.400145,    1,    2,    1;
      0.8263017,    0.5,    3,    1])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsR32(
    ai={0.000436654,0.00000178134},
    corrG=121,
    coefG={-3.440E-03,4.700E-05,4.350E-09,0.0,0.0},
    diluteModel=9,
    nistCoeff={1.2942,-0.0924549},
    corrL=50,
    coefL={3.7296E-01,-8.8707E-04,2.5762E-07,0.0,0.0},
    residualModel=10,
    criticalModel=2
  );

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsR32(
    epsilon=289.65,
    sigma=0.4098,
    Fc=1.0,
    diluteModel=3,
    initialModel=0,
    C=0.79022,
    clg=[
      0.6100913843,        0.0;
      0.4508958312,        1.2;
      -0.017063,        -0.308598;
      0.000564,        0.035317],
    rhoSrc=-107473.04273260638,
    nistCoeff={0.7954,0.0542658,0.0},
    corrL=30,
    coefL={-1.7723E+01,8.502E+02,1.0601E+00,-1.1719E-18,7.000E+00},
    residualModel=9);
	
  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsR32(
    Tc=351.255,
    coeffs=[
      0.07147,        1.246]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsR32(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      0.019194334673139708,        0.531;
      -6.794802163795212,        0.979;
      9.276391392786632,        2.203;
      -12.327153852761946,        2.382;
      28.46579606476374,        3.421;
      -28.570870718190093,        3.558],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      3.0283368557227064,        0.358;
      -13.30754793568124,        0.676;
      53.97035773548243,        0.831;
      -41.10515088784585,        0.88;
      0.6410010855629815,        2.592;
      -18.757652443918627,        16.556],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -0.06522522852577171,        0.069;
      -3.3577643698607456,        0.425;
      -2.746299718061842,        1.18;
      -64.77289013657663,        8.115;
      511.3349286855849,        12.06;
      -1525.315265366156,        16.085])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: TillnerRoth-JPCRD-1997</p>
<p>Conductivity: Huber-IECR-2003 plus correlations</p>
<p>Viscosity: ECS plus residual entropy plus correlations</p>
<p>Surface tension: Mulero-JPCRD-2012</p>
</body>
  </html>"));
end R32;

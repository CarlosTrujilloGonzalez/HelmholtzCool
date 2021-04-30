within HelmholtzMedia.HelmholtzFluidsAB;
package Butene_cis_2 "Butene_cis_2"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="cis-2-butene" "short name",
  final fluidConstants={fluidConstantsButene_cis_2},
  final helmholtzCoefficients=helmholtzCoefficientsButene_cis_2,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsButene_cis_2,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsButene_cis_2,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsButene_cis_2,
  final ancillaryCoefficients=ancillaryCoefficientsButene_cis_2,
  final fluidLimits=fluidLimitsButene_cis_2,
  final refSubstance=ReferenceSubstance.Propane,
  final referenceHelmholtzCoeff = HelmholtzFluidsPQ.Propane.helmholtzCoefficientsPropane,
  final referenceConstants =  HelmholtzFluidsPQ.Propane.fluidConstantsPropane,
  final referenceViscosityCoeff = HelmholtzFluidsPQ.Propane.dynamicViscosityCoefficientsPropane,
  final referenceConductivityCoeff = HelmholtzFluidsPQ.Propane.thermalConductivityCoefficientsPropane,
  Density(min=fluidLimitsButene_cis_2.DMIN, max=fluidLimitsButene_cis_2.DMAX, start=fluidConstantsButene_cis_2.molarMass/fluidConstantsButene_cis_2.criticalMolarVolume),
  Temperature(min=fluidLimitsButene_cis_2.TMIN, max=fluidLimitsButene_cis_2.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsButene_cis_2.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsButene_cis_2.HMIN, max=fluidLimitsButene_cis_2.HMAX, start=(fluidLimitsButene_cis_2.HMIN+fluidLimitsButene_cis_2.HMAX)/2),
  SpecificEntropy(min=fluidLimitsButene_cis_2.SMIN, max=fluidLimitsButene_cis_2.SMAX, start=(fluidLimitsButene_cis_2.SMIN+fluidLimitsButene_cis_2.SMAX)/2));

  final constant FluidConstants
  fluidConstantsButene_cis_2(
    casRegistryNumber="590-18-1",
    molarMass=0.05610631999999999,
    hasCriticalData=true,
       criticalTemperature=435.75,
       criticalPressure=4225500.0,
       criticalMolarVolume=0.000235626767200754,
       HCRIT0=486660.73414397205,//CoolProp OK
       SCRIT0=1311.5026060476048,//CoolProp OK
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
       acentricFactor=0.20235958587,
    triplePointTemperature=134.3,
    triplePointPressure=0.2636497215092638,
    normalBoilingPoint=276.87,
    meltingPoint=134.3) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsButene_cis_2(
    TMIN=fluidConstantsButene_cis_2.triplePointTemperature,
    TMAX=525,
    DMIN=Modelica.Constants.small,
    DMAX=790.54,//RefProp
    //DMAX=807.6,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=50000000,
    HMIN=-2.9e5,
    HMAX=875128,
    SMIN=-1461.57,
    SMAX=23165.7) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsButene_cis_2(
    idealLead={0.2591542, 2.4189888},
    idealLog=[
      2.9687,         1.],
    idealEinstein=[
      3.2375,        -0.5691336775674125;
      7.0437,        -2.714859437751004;
      11.414,        -4.800917957544463;
      7.3722,        -10.09064830751578],
    idealIIRoffset={-6.94441, 3.22147},
    idealNBPoffset={0.0, 0.0},
    residualPoly=[
      0.77827,    0.12,    1;
      -2.8064,    1.3,    1;
      1.003,    1.74,    1;
      0.013762,    2.1,    2;
      0.085514,    0.28,    3;
      0.00021268,    0.69,    7],
    residualBwr=[
      0.22962,    0.75,    2,    1;
      -0.072442,    2,    5,    1;
      -0.23722,    4.4,    1,    2;
      -0.074071,    4.7,    4,    2;
      -0.026547,    15,    3,    3;
      0.012032,    14,    4,    3])
  "Coefficients of the Helmholtz EoS";
  
  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsButene_cis_2(
    ai={0.00102143,6.64409e-7},
    corrG=120,
    coefG={6.7737E-05,1.0709E+00,-6.5881E+01,1.2939E+05,0.0},
    diluteModel=9,
    nistCoeff={0.838527,0.0648013},
    corrL=50,
    coefL={3.65837E-01,-1.8718E-03,7.84396E-06,-2.18323E-08,2.33149E-11},
    residualModel=9,
    qD=1.647E+09,
    zeta0=2.1e-10,
    Gamma=0.058,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsButene_cis_2(
    epsilon=259.0,
    sigma=0.5508,
    corrG=110,
    coefG={4.2898E-08,9.1349E-01,0.0,0.0,0.0},
    diluteModel=3,
    initialModel=0,
    nistCoeff={1.12449,-0.147034,0.036655},
    corrL=32,
    coefL={-6.3837,6.8524E+02,1.8356E-02,-2.3949E-05,0.0},
    residualModel=9);
  
  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsButene_cis_2(
    Tc=435.75,
    coeffs=[
      0.05903,        1.246]) "Coefficients for the surface tension";
  
  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsButene_cis_2(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      0.0677302414418938,        0.331;
      -4.8343076872999236,        0.886;
      -5.4106633030712565,        1.813;
      41.30992857221284,        2.731;
      -40.52816223536726,        2.888;
      -0.6515323361189119,        8.459],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      -2.0818345732351684,        0.26;
      6.807747893614343,        0.351;
      -111.04784929056088,        0.795;
      120.09826778110036,        0.831;
      -12.601532453548211,        1.18;
      1.7960675631510878,        2.144],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -84.9269743250438,        0.539;
      89.02084598490362,        0.554;
      -9.271866684444854,        0.74;
      -4.116354594069339,        3.876;
      -1.1445772731784132,        7.701;
      16.852533778316815,        19.761])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Lemmon-FPE-2005</p>
<p>Viscosity and thermal conductivity: ECS plus correlations</p>
<p>Surface tension: Mulero-JPCRD-2014</p>
</body>
  </html>"));
end Butene_cis_2;

within HelmholtzMedia.HelmholtzFluidsCD;
package DiethylEther "DiethylEther"
extends Interfaces.PartialHelmholtzMedium(
  mediumName="diethylether" "short name",
  final fluidConstants={fluidConstantsDiethylEther},
  final helmholtzCoefficients=helmholtzCoefficientsDiethylEther,
  final thermalConductivityCoefficients=thermalConductivityCoefficientsDiethylEther,
  final dynamicViscosityCoefficients=dynamicViscosityCoefficientsDiethylEther,
  final surfaceTensionCoefficients=surfaceTensionCoefficientsDiethylEther,
  final ancillaryCoefficients=ancillaryCoefficientsDiethylEther,
  final fluidLimits=fluidLimitsDiethylEther,
  final refSubstance=ReferenceSubstance.Propane,
  final referenceHelmholtzCoeff = Transport.ECSreferences.helmholtzCoefficientsPropane,
  referenceConstants =  Transport.ECSreferences.fluidConstantsPropane,
  referenceViscosityCoeff = Transport.ECSreferences.dynamicViscosityCoefficientsPropane,
  referenceConductivityCoeff = Transport.ECSreferences.thermalConductivityCoefficientsPropane,
  Density(min=fluidLimitsDiethylEther.DMIN, max=fluidLimitsDiethylEther.DMAX, start=fluidConstantsDiethylEther.molarMass/fluidConstantsDiethylEther.criticalMolarVolume),
  Temperature(min=fluidLimitsDiethylEther.TMIN, max=fluidLimitsDiethylEther.TMAX, start=298.15),
  AbsolutePressure(min=0, max=fluidLimitsDiethylEther.PMAX, start=101325),
  SpecificEnthalpy(min=fluidLimitsDiethylEther.HMIN, max=fluidLimitsDiethylEther.HMAX, start=(fluidLimitsDiethylEther.HMIN+fluidLimitsDiethylEther.HMAX)/2),
  SpecificEntropy(min=fluidLimitsDiethylEther.SMIN, max=fluidLimitsDiethylEther.SMAX, start=(fluidLimitsDiethylEther.SMIN+fluidLimitsDiethylEther.SMAX)/2));

  final constant FluidConstants
  fluidConstantsDiethylEther(
    casRegistryNumber="60-29-7",
    molarMass=0.0741216,
    hasCriticalData=true,
       criticalTemperature=466.7,
       criticalPressure=3649016.896528536,
       criticalMolarVolume=0.0002807636366617563,
       HCRIT0=145874.64953283616,//CoolProp OK
       SCRIT0=113.57907976894307,//CoolProp OK
    hasIdealGasHeatCapacity=false,
    hasDipoleMoment=true,
       dipoleMoment=1.3,
    hasFundamentalEquation=true,
    hasLiquidHeatCapacity=true,
    hasSolidHeatCapacity=false,
    hasAccurateViscosityData=false,
    hasAccurateConductivityData=false,
    hasVapourPressureCurve=true,
    hasAcentricFactor=true,
       acentricFactor=0.2819293311752744,
    triplePointTemperature=270,
    triplePointPressure=21283.811029807002,
    normalBoilingPoint=307.7,
    meltingPoint=270) "Fluid Constants";

  final constant FluidLimits
  fluidLimitsDiethylEther(
    TMIN=fluidConstantsDiethylEther.triplePointTemperature,
    TMAX=548,
    DMIN=Modelica.Constants.small,
    DMAX=809.6,//EOS calculation
    PMIN=Modelica.Constants.small,
    PMAX=100000000.0,
    HMIN=-435907,
    HMAX=503588,
    SMIN=-1569.7,
    SMAX=16757.2) "Helmholtz EoS Limits";

  final constant EoS.HelmholtzCoefficients
  helmholtzCoefficientsDiethylEther(
    idealLead={17.099494, -6.160844},
    idealLog=[
      3.36281,         1.],
    idealPower=[
      -8.943822,      -1;
      0.54621,      -2;
      -0.016604,      -3],
    idealIIRoffset={-21.4265, 12.0115},
    idealNBPoffset={-10.0691, 6.67036},
    residualPoly=[
      0.376700499,    -0.75,    1;
      -0.116630334,    -0.25,    1;
      -0.73801498,    1.25,    1;
      -0.2725701,    0.75,    2;
      -0.04979231,    -1,    3;
      0.172267029,    -0.375,    3;
      0.0044161891,    1.25,    5],
    residualBwr=[
      -1.53951612,    2.375,    1,    1;
      1.15606052,    3.0,    1,    1;
      -0.0184504019,    2.625,    2,    1;
      -0.101800599,    1.875,    5,    1;
      -0.403598704,    4.5,    1,    2;
      0.00213055571,    5.75,    3,    2;
      -0.154741976,    5.375,    4,    2;
      0.0120950552,    2.75,    5,    2;
      -0.0143106371,    14.5,    2,    3])
  "Coefficients of the Helmholtz EoS";

  final constant Transport.ThermalConductivityCoefficients
  thermalConductivityCoefficientsDiethylEther(
    ai={0.00132},
    diluteModel=9,
    nistCoeff={1.16276,-0.0357361},
    residualModel=9,
    qD=1550387597,
    zeta0=1.96e-10,
    Gamma=0.066,
    criticalModel=2);

  final constant Transport.DynamicViscosityCoefficients
  dynamicViscosityCoefficientsDiethylEther(
    epsilon=370.6,
    sigma=0.53,
    Fc=0.9,
    diluteModel=3,
    initialModel=0,
    nistCoeff={1.15039,-0.1535,0.0330048},
    residualModel=9);
    
  final constant Transport.SurfaceTensionCoefficients
  surfaceTensionCoefficientsDiethylEther(
    Tc=466.7,
    coeffs=[
      1.2348,        1.4846;
      -1.1808,        1.5021]) "Coefficients for the surface tension";

  final constant Ancillary.AncillaryCoefficients
  ancillaryCoefficientsDiethylEther(
    pressureSaturationModel=PressureSaturationModel.PS5,
    pressureSaturation=[
      4033.9605193670827,        0.362;
      -46575.73734989262,        0.3685;
      43764.48293843155,        0.3695;
      -1223.2935292911732,        0.383;
      -5.8850985714687,        1.0;
      -3.6831359630287133,        3.5],
    densityLiquidModel=DensityLiquidModel.DL1,
    densityLiquid=[
      5.682880383241632,        0.14300000000000002;
      -5263.469994240878,        0.353;
      23798.393607859573,        0.374;
      -35374.58571701918,        0.38849999999999996;
      16836.712657250806,        0.39799999999999996;
      -0.09757711746576947,        3.3333333333333335],
    densityVaporModel=DensityVaporModel.DV5,
    densityVapor=[
      -1.3943406980372655,        0.1;
      1151.6019785628107,        0.3535;
      -1281.554541791759,        0.3565;
      126.75688153139006,        0.376;
      -3.605448381981594,        2.5;
      -9.927752538828088,        7.333333333333333])
  "Coefficients for the ancillary equations";
  annotation(
  Documentation(info = "<html>
<body>
<p><b>From CoolProp 2020</b></p>
<p>EOS: Thol-IJT-2014</p>
<p>Surface tension: Mulero-JPCRD-2014</p>
</body>
  </html>"));
end DiethylEther;

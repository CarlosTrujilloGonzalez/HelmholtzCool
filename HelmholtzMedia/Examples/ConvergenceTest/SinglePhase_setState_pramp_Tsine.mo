within HelmholtzMedia.Examples.ConvergenceTest;
model SinglePhase_setState_pramp_Tsine
  package Medium = HelmholtzFluidsAB.Butane;
  Medium.AbsolutePressure p(start=101325);
  Medium.Temperature T(start=298.15);

  Medium.ThermodynamicState state;
  Medium.ThermodynamicState state_dT;
  Medium.ThermodynamicState state_pd;
  Medium.ThermodynamicState state_ph;
  Medium.ThermodynamicState state_ps;
  Medium.ThermodynamicState state_Ts;

Modelica.Blocks.Sources.Ramp p_sub(
    duration=4,
    startTime=0.1,
    height=pcrit - pmin,
    offset=pmin)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));

Modelica.Blocks.Sources.Ramp p_super(
    duration=5,
    startTime=6,
    offset=0,
    height=pmax - pcrit)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));

Modelica.Blocks.Sources.Sine T_sine(
    freqHz=100,
    startTime=0,
    amplitude=(Tmax - Tmin)/2,
    offset=(Tmax - Tmin)/2 + Tmin)
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));

protected
  Medium.AbsolutePressure p_melt;
  constant Medium.Temperature Tmin=Medium.fluidLimits.TMIN;
  constant Medium.Temperature Tcrit=Medium.fluidConstants[1].criticalTemperature;
  constant Medium.Temperature Tmax=Medium.fluidLimits.TMAX;
  constant Medium.AbsolutePressure pmin=Medium.fluidConstants[1].triplePointPressure;
  constant Medium.AbsolutePressure pcrit=Medium.fluidConstants[1].criticalPressure;
  constant Medium.AbsolutePressure pmax=Medium.fluidLimits.PMAX;

equation
  T = T_sine.y;
  p_melt = Medium.Ancillary.meltingPressure_T(T);
  p = min(p_melt, p_sub.y + p_super.y);

  // set state to valid single-phase values
  state=Medium.setState_pT(p=p, T=T, phase=0);

  // call other setState functions
  state_dT=Medium.setState_dT(d=Medium.density(state), T=Medium.temperature(state), phase=0);
  state_pd=Medium.setState_pd(p=Medium.pressure(state), d=Medium.density(state), phase=0);
  state_ph=Medium.setState_ph(p=Medium.pressure(state), h=Medium.specificEnthalpy(state), phase=0);
  state_ps=Medium.setState_ps(p=Medium.pressure(state), s=Medium.specificEntropy(state), phase=0);
  state_Ts=Medium.setState_Ts(T=Medium.temperature(state), s=Medium.specificEntropy(state), phase=0);

annotation (experiment(StopTime=12));
end SinglePhase_setState_pramp_Tsine;

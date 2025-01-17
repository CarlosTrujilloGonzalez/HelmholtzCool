within HelmholtzMedia.Examples.Validation;
model MaxwellLoop "show Maxwell Loops"
  replaceable package Medium = HelmholtzFluidsAB.Butane;
  parameter Medium.Temperature T=0.9*Tcrit;

  Medium.Density d;
  Modelica.SIunits.SpecificVolume v=1/d;
  Medium.ThermodynamicState state=Medium.setState_dTX(d=d, T=T);
  Medium.EoS.HelmholtzDerivs f=Medium.EoS.setHelmholtzDerivsThird(d=d, T=T, phase=1);
  Medium.AbsolutePressure p=Medium.EoS.p(f);

protected
  constant Medium.MolarMass MM=Medium.fluidConstants[1].molarMass;
  constant Medium.SpecificHeatCapacity R_s=Modelica.Constants.R/MM
    "specific gas constant";
  constant Medium.Temperature Tcrit=Medium.fluidConstants[1].criticalTemperature;
  constant Medium.Density dcrit=MM/Medium.fluidConstants[1].criticalMolarVolume;
  parameter Medium.Density dmin=0.8*Medium.dewDensity(Medium.setSat_T(T));
  parameter Medium.Density dmax=1.02*Medium.bubbleDensity(Medium.setSat_T(T));

public
  Modelica.Blocks.Sources.Ramp Ramp_dvap(
    duration=4,
    startTime=0.1,
    height=dcrit - dmin,
    offset=dmin)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Sources.Ramp Ramp_dliq(
    duration=5,
    startTime=6,
    height=dmax - dcrit,
    offset=0)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));

equation
  d = Ramp_dvap.y + Ramp_dliq.y;

  annotation (
    Documentation(info="
<html>
This model is used to compare the curvatures of two sub-critical isotherms in the two-phase region of a p,d-plot.<br />
One isotherm is calcualted directly from the EoS (showing some loops in the two-phase region), <br />
one isotherm is calculated taking into account the VLE conditions (straight line in the two-phase region).<br />

How to use:
<ol>
  <li>Simulate with <code>T&lt;T_crit</code></li>
  <li>Plot <code>p</code> and <code>state.p</code> </li>
  <li>Make <code>d</code> the independent variable of the plot </li>
  <li>Rescale the range for <code>p</code> to something like -100 to +100 </li>
  <li>Look at the loops </li>
</ol>

<dl>
<dt>Further reading:</dt>
<dt>Lemmon, E. W. and Jacobsen, R. T.:</dt>
<dd><b>A New Functional Form and New Fitting Techniques for Equations of State with Application to Pentafluoroethane (HFC-125)</b>.<br />
    Journal of Physical and Chemical Reference Data 34 (1) , 69-108 (2005)<br />
    DOI: <a href=\"http://dx.doi.org/10.1063/1.1797813\">10.1063/1.1797813</a>
</dd>
</dl>
</html>"),
experiment(StopTime=12));
end MaxwellLoop;

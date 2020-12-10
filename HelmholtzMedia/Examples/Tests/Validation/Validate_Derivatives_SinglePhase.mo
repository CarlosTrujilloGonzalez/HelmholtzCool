within HelmholtzMedia.Examples.Tests.Validation;
model Validate_Derivatives_SinglePhase
  "compare analytical derivatives to numerical derivatives"

  package Medium = HelmholtzFluids.Butane;
  // choose d and T which will result in single-phase
  parameter Medium.Density d=1e-3;
  parameter Medium.Temperature T=298.15;

// Pressure derivatives
  Medium.Types.DerPressureByDensity dpdT_analytical;
  Medium.Types.DerPressureByDensity dpdT_numerical;
  Medium.Types.DerPressureByTemperature dpTd_analytical;
  Medium.Types.DerPressureByTemperature dpTd_numerical;
// Enthalpy derivatives
  Medium.Types.DerEnthalpyByDensity dhdT_analytical;
  Medium.Types.DerEnthalpyByDensity dhdT_numerical;
  Medium.Types.DerEnthalpyByTemperature dhTd_analytical;
  Medium.Types.DerEnthalpyByTemperature dhTd_numerical;
// Energy derivatives
  Medium.Types.DerEnergyByDensity dudT_analytical;
  Medium.Types.DerEnergyByDensity dudT_numerical;
  Medium.Types.DerEnergyByTemperature duTd_analytical;
  Medium.Types.DerEnergyByTemperature duTd_numerical;
// Entropy derivatives
  Medium.Types.DerEntropyByDensity dsdT_analytical;
  Medium.Types.DerEntropyByDensity dsdT_numerical;
  Medium.Types.DerEntropyByTemperature dsTd_analytical;
  Medium.Types.DerEntropyByTemperature dsTd_numerical;
// Gibbs derivatives
  Medium.Types.DerEnergyByDensity dgdT_analytical;
  Medium.Types.DerEnergyByDensity dgdT_numerical;
  Medium.Types.DerEnergyByTemperature dgTd_analytical;
  Medium.Types.DerEnergyByTemperature dgTd_numerical;
// Further derivatives
  Medium.VelocityOfSound a_analytical1;
  Medium.VelocityOfSound a_analytical2;

protected
  Real eps= 1e-3;
  Medium.ThermodynamicState state=Medium.setState_dTX(d=d, T=T);
  Medium.HelmholtzDerivs f=Medium.setHelmholtzDerivs(T=state.T, d=state.d, phase=state.phase);
  Medium.ThermodynamicState d_plus=Medium.setState_dTX(d=d+eps*d, T=T);
  Medium.ThermodynamicState d_minus=Medium.setState_dTX(d=d-eps*d, T=T);
  Medium.ThermodynamicState T_plus=Medium.setState_dTX(d=d, T=T+eps*T);
  Medium.ThermodynamicState T_minus=Medium.setState_dTX(d=d, T=T-eps*T);

equation
  Modelica.Utilities.Streams.print(" ");
  Modelica.Utilities.Streams.print("====|====|====|====|====|====|====|====|====|====|====|====|====|====|====|====|"); // 80 characters
  Modelica.Utilities.Streams.print(" ");

  Modelica.Utilities.Streams.print("Pressure");
  // check (dp/dd)@T=const
  dpdT_analytical = Medium.pressure_derd_T(state=state);
  dpdT_numerical = (d_plus.p-d_minus.p)/(d_plus.d-d_minus.d);
  Modelica.Utilities.Streams.print("  (dp/dd)@T=const analytical= " + String(dpdT_analytical));
  Modelica.Utilities.Streams.print("  (dp/dd)@T=const  numerical= " + String(dpdT_numerical));
  // check (dp/dT)@d=const
  dpTd_analytical = Medium.pressure_derT_d(state=state);
  dpTd_numerical = (T_plus.p-T_minus.p)/(T_plus.T-T_minus.T);
  Modelica.Utilities.Streams.print("  (dp/dT)@d=const analytical= " + String(dpTd_analytical));
  Modelica.Utilities.Streams.print("  (dp/dT)@d=const  numerical= " + String(dpTd_numerical));

  Modelica.Utilities.Streams.print(" ");
  Modelica.Utilities.Streams.print("Enthalpy");
  // check (dh/dd)@T=const
  dhdT_analytical = Medium.specificEnthalpy_derd_T(state=state);
  dhdT_numerical = (d_plus.h-d_minus.h)/(d_plus.d-d_minus.d);
  Modelica.Utilities.Streams.print("  (dh/dd)@T=const analytical= " + String(dhdT_analytical));
  Modelica.Utilities.Streams.print("  (dh/dd)@T=const  numerical= " + String(dhdT_numerical));
  // check (dh/dT)@d=const
  dhTd_analytical = Medium.specificEnthalpy_derT_d(state=state);
  dhTd_numerical = (T_plus.h-T_minus.h)/(T_plus.T-T_minus.T);
  Modelica.Utilities.Streams.print("  (dh/dT)@d=const analytical= " + String(dhTd_analytical));
  Modelica.Utilities.Streams.print("  (dh/dT)@d=const  numerical= " + String(dhTd_numerical));

  Modelica.Utilities.Streams.print(" ");
  Modelica.Utilities.Streams.print("internal Energy");
  // check (du/dd)@T=const
  dudT_analytical = f.R_s*T/d*f.tau*f.delta*f.rtd;
  dudT_numerical = (d_plus.u-d_minus.u)/(d_plus.d-d_minus.d);
  Modelica.Utilities.Streams.print("  (du/dd)@T=const analytical= " + String(dudT_analytical));
  Modelica.Utilities.Streams.print("  (du/dd)@T=const  numerical= " + String(dudT_numerical));
  // check (du/dT)@d=const
  duTd_analytical = Medium.specificHeatCapacityCv(state=state);
  duTd_numerical = (T_plus.u-T_minus.u)/(T_plus.T-T_minus.T);
  Modelica.Utilities.Streams.print("  (du/dT)@d=const analytical= " + String(duTd_analytical));
  Modelica.Utilities.Streams.print("  (du/dT)@d=const  numerical= " + String(duTd_numerical));

  Modelica.Utilities.Streams.print(" ");
  Modelica.Utilities.Streams.print("Entropy");
  // check (ds/dd)@T=const
  //dsdT_analytical = f.R_s/d*(-(1+f.delta*f.rd)+(0+f.tau*f.delta*f.rtd));
  dsdT_analytical =  -f.R_s/d*(  1+f.delta*f.rd    -f.tau*f.delta*f.rtd);
  dsdT_numerical = (d_plus.s-d_minus.s)/(d_plus.d-d_minus.d);
  Modelica.Utilities.Streams.print("  (ds/dd)@T=const analytical= " + String(dsdT_analytical));
  Modelica.Utilities.Streams.print("  (ds/dd)@T=const  numerical= " + String(dsdT_numerical));
  // check (ds/dT)@d=const
  dsTd_analytical = f.R_s/T*(-f.tau^2*(f.itt+f.rtt));
  dsTd_numerical = (T_plus.s-T_minus.s)/(T_plus.T-T_minus.T);
  Modelica.Utilities.Streams.print("  (ds/dT)@d=const analytical= " + String(dsTd_analytical));
  Modelica.Utilities.Streams.print("  (ds/dT)@d=const  numerical= " + String(dsTd_numerical));

  Modelica.Utilities.Streams.print(" ");
  Modelica.Utilities.Streams.print("Gibbs energy");
  // check (dg/dd)@T=const
  dgdT_analytical = f.R_s*T/d*(1+2*f.delta*f.rd + f.delta^2*f.rdd);
  dgdT_numerical = ((d_plus.h-d_plus.T*d_plus.s)-(d_minus.h-d_minus.T*d_minus.s))/(d_plus.d-d_minus.d);
  Modelica.Utilities.Streams.print("  (dg/dd)@T=const analytical= " + String(dgdT_analytical));
  Modelica.Utilities.Streams.print("  (dg/dd)@T=const  numerical= " + String(dgdT_numerical));
  // check (dg/dT)@d=const
  dgTd_analytical = f.R_s*(f.i+f.r + 1+f.delta*f.rd -f.tau*(f.it+f.rt) - f.tau*f.delta*f.rtd);
  dgTd_numerical = ((T_plus.h-T_plus.T*T_plus.s)-(T_minus.h-T_minus.T*T_minus.s))/(T_plus.T-T_minus.T);
  Modelica.Utilities.Streams.print("  (dg/dT)@d=const analytical= " + String(dgTd_analytical));
  Modelica.Utilities.Streams.print("  (dg/dT)@d=const  numerical= " + String(dgTd_numerical));

  Modelica.Utilities.Streams.print(" ");
  Modelica.Utilities.Streams.print("Further derivatives");
  a_analytical1 = Medium.velocityOfSound(state=state);
  a_analytical2 = sqrt(dpdT_analytical-dpTd_analytical*dsdT_analytical/dsTd_analytical);
  Modelica.Utilities.Streams.print("  (dp/dd)@s=const analytical1= " + String(a_analytical1));
  Modelica.Utilities.Streams.print("  (dp/dd)@s=const analytical2= " + String(a_analytical2));

annotation (experiment(NumberOfIntervals=1));
end Validate_Derivatives_SinglePhase;

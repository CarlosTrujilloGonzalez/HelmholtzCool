within HelmholtzMedia.Examples;
model BranchingDynamicPipes
  extends Modelica.Fluid.Examples.BranchingDynamicPipes(
    redeclare package Medium =
        HelmholtzMedia.HelmholtzFluidsCD.Carbondioxide_Short,
        //FreeFluids.TMedia.Fluids.CO2,
    system(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial));

  annotation (experiment(
      StopTime=1,
      Tolerance=1e-05));
end BranchingDynamicPipes;

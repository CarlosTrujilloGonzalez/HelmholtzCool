within HelmholtzMedia.Examples.MediaTestModels;
model ButaneTestModel_dT "Test HelmholtzMedia.HelmholtzFluids.Butane"
  extends Modelica.Icons.Example;
  extends Modelica.Media.Examples.Tests.Components.PartialTestModel(
    redeclare package Medium = HelmholtzMedia.HelmholtzFluidsAB.Butane(inputChoice=Medium.InputChoice.dT),
    ambient(use_p_ambient=true, use_T_ambient=false));

  annotation (experiment(StopTime=1.01), Diagram(graphics));

end ButaneTestModel_dT;

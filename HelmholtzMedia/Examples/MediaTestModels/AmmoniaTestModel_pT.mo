within HelmholtzMedia.Examples.MediaTestModels;
model AmmoniaTestModel_pT "Test HelmholtzMedia.HelmholtzFluids.Butane"
  extends Modelica.Icons.Example;
  extends Modelica.Media.Examples.Tests.Components.PartialTestModel(
    redeclare package Medium = HelmholtzMedia.HelmholtzFluids.Ammonia(inputChoice=Medium.InputChoice.pT),
    ambient(use_p_ambient=true, use_T_ambient=false));

  annotation (experiment(StopTime=1.01), Diagram(graphics));

end AmmoniaTestModel_pT;

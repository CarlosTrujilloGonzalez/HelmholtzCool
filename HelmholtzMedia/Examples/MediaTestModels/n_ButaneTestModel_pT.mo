within HelmholtzMedia.Examples.MediaTestModels;
model n_ButaneTestModel_pT "Test HelmholtzMedia.HelmholtzFluids.Butane"
  extends Modelica.Icons.Example;
  extends Modelica.Media.Examples.Tests.Components.PartialTestModel(
    redeclare package Medium = HelmholtzMedia.HelmholtzFluids.n_Butane(inputChoice=Medium.InputChoice.pT),
    ambient(use_p_ambient=true, use_T_ambient=false));

  annotation (experiment(StopTime=1.01), Diagram(graphics));

end n_ButaneTestModel_pT;

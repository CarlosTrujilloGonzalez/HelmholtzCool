within HelmholtzMedia.Examples.MediaTestModels;
model R134a_ASHRAE_TestModel_ph "Test HelmholtzMedia.HelmholtzFluids.R134a"
  extends Modelica.Icons.Example;
  extends Modelica.Media.Examples.Tests.Components.PartialTestModel(
     redeclare package Medium = HelmholtzMedia.HelmholtzFluidsR.R134a,
     fixedMassFlowRate(use_T_ambient=false),
     ambient(use_T_ambient=false),
     volume(use_T_start=false));

  annotation (experiment(StopTime=11));

end R134a_ASHRAE_TestModel_ph;

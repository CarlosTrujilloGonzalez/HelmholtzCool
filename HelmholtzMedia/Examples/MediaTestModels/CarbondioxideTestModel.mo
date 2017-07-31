within HelmholtzMedia.Examples.MediaTestModels;
model CarbondioxideTestModel
  "Test HelmholtzMedia.HelmholtzFluids.Carbondioxide"
  extends Modelica.Icons.Example;
  extends Modelica.Media.Examples.Tests.Components.PartialTestModel(
     redeclare package Medium = HelmholtzMedia.HelmholtzFluids.Carbondioxide);

  annotation (experiment(StopTime=11));

end CarbondioxideTestModel;

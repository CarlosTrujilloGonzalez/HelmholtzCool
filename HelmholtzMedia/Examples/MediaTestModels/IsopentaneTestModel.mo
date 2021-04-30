within HelmholtzMedia.Examples.MediaTestModels;
model IsopentaneTestModel "Test HelmholtzMedia.HelmholtzFluids.Isopentane"
  extends Modelica.Icons.Example;
  extends Modelica.Media.Examples.Tests.Components.PartialTestModel(
     redeclare package Medium = HelmholtzMedia.HelmholtzFluidsIJK.Isopentane);

  annotation (experiment(StopTime=11));

end IsopentaneTestModel;

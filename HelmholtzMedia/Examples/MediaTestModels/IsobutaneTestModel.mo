within HelmholtzMedia.Examples.MediaTestModels;
model IsobutaneTestModel "Test HelmholtzMedia.HelmholtzFluids.Isobutane"
  extends Modelica.Icons.Example;
  extends Modelica.Media.Examples.Tests.Components.PartialTestModel(
     redeclare package Medium = HelmholtzMedia.HelmholtzFluidsIJK.IsoButane);

  annotation (experiment(StopTime=11));

end IsobutaneTestModel;

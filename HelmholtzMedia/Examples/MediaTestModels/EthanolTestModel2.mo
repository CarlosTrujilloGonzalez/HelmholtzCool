within HelmholtzMedia.Examples.MediaTestModels;
model EthanolTestModel2 "Test HelmholtzMedia.HelmholtzFluids.Ethanol"
  extends Modelica.Icons.Example;
  extends Modelica.Media.Examples.Tests.Components.PartialTestModel2(
     redeclare package Medium = HelmholtzMedia.HelmholtzFluidsEF.Ethanol);

  annotation (experiment(StopTime=11));

end EthanolTestModel2;

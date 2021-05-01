# HelmholtzMedia
Is a very powerful library for the calculation or fluid properties written in Modelica language, developed by Matthis Thorade and licensed under the BSD-3-Clause license.
The main limitations are related to the limited number of fluid definitions inside the package, and the limited span of transport properties calculation. 

## CoolProp
Is an incredible soft for fluid properties calculation written in C++, developed by Ian Bell and others and licensed under the MIT license.
For some reason that I ignore, it seems quite difficult to run it from OpenModelica.
The soft is also short of transport properties calculation alternatives, as it is focused in reference equations not always available.  

## HelmholtzCool
Is a fork of HelmholtzMedia made by Carlos Trujillo, that uses a lot of fluids data from CoolProp.
The soft has been modified to make it compatible with the calculation structure used by CoolProp.
The Transport package has been completely rewritten, and the EoS package modified in order to enlarge the ideal part treatment.
In addition to the CoolProp possibilities for transport properties, it is also possible to use temperature correlations with pressure correction.
I have also enlarged the number of fluids with ECS calculation. The data for ECS has been taken from Marcia L. Huber 2018 NIST IR 8209.
It is possible to use different reference states for enthalpy and entropy. But care should be taken, as changing the reference state afects the enthalpy and entropy limits.
The fluids package has been splitted in several packages due to the large number of fluids expected, and to the fact that the opening of the packages in OpenModelica is slow.
I will continue adding fluids from CoolProp and complementing transport properties when lacking.
 
## License
For the original HelmholtzMedia soft: Copyright  2009-2020 Matthis Thorade
For the CoolProp data: Copyright (C) 2012-2016 Ian H. Bell and other CoolProp developers
For the additions and modifications of the original HelmholtzMedia soft: Copyright (C) 2021 Carlos Trujillo Gonzalez
You will find in this folder the licenses for the original softs.
The additions and modifications are licensed by C.Trujillo under the GPL version 3 license.




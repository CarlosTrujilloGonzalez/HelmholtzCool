within HelmholtzMedia.Interfaces.PartialHelmholtzMedium.Transport;
function physPropCorr
  "This file is part of the Free Fluids application
  Copyright (C) 2008-2021  Carlos Trujillo Gonzalez
    
  This program is free software; you can redistribute it and/or
  modify it under the terms of the GNU General Public License version 3
  as published by the Free Software Foundation
    
  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
    
  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA."
	
  input Integer cor;
  input Real coef[:];
  input Real MW;
  input Real x;
  output Real y;
protected
  Real R=Modelica.Constants.R;
  Real Tm;
  Integer j;
algorithm
  if cor == 1 or cor == 2 or cor == 6 or cor == 15 or cor == 16 or cor == 17 or cor == 40 or cor == 49 or cor == 50 or cor == 60 or cor == 70 or cor == 71 or cor == 80 or cor == 82 or cor == 100 or cor == 111 or cor == 121 or cor == 140 or cor == 150 then
    y := coef[1] + x * (coef[2] + x * (coef[3] + x * (coef[4] + x * coef[5]))) "FF_DIPPR100.ok";
  elseif cor == 63 then
    Tm := x - 273.15;
    y := coef[1] + Tm * (coef[2] + Tm * (coef[3] + Tm * (coef[4] + Tm * coef[5]))) "FF_DIPPR100 in deg C";
  elseif cor == 10 then
    y := coef[1] + x * (coef[2] + x * (coef[3] + x * (coef[4] + x * (coef[5] + x * coef[6])))) "FF_Polynomial";
  elseif cor == 130 then
    y := coef[1] + coef[2] * x ^ 0.125 + coef[3] * x ^ 0.25 + coef[4] * x ^ 0.5 + coef[5] * x "FF_Polynomial2.ok";
  elseif cor == 20 or cor == 21 or cor == 30 then
    y := exp(coef[1] + coef[2] / x + coef[3] * log(x) + coef[4] * x ^ coef[5]) "FF_DIPPR101.ok";
  elseif cor == 81 or cor == 110 or cor == 120 then
    y := coef[1] * x ^ coef[2] / (1 + coef[3] / x + coef[4] / x ^ 2) "FF_DIPPR102.ok";
  elseif cor == 41 or cor == 42 then
    y := coef[1] / coef[2] ^ (1 + (1 - x / coef[3]) ^ coef[4]) "FF_DIPPR105";
  elseif cor == 45 or cor == 47 or cor == 61 or cor == 90 or cor == 91 then
    Tm := x / coef[6];
    y := coef[1] * (1 - Tm) ^ (coef[2] + coef[3] * Tm + coef[4] * Tm ^ 2 + coef[5] * Tm ^ 3) "FF_DIPPR106.ok";
  elseif cor == 3 or cor == 4 or cor == 200 then
    y := coef[1] + coef[2] * (coef[3] / x / sinh(coef[3] / x)) ^ 2 + coef[4] * (coef[5] / x / cosh(coef[5] / x)) ^ 2 "FF_DIPPR107.ok";
  elseif cor == 5 then
    Tm := (x - coef[8]) / (x + coef[7]);
    y := R * (coef[1] + coef[2] / x ^ 2 * exp(-coef[3] / x) + coef[4] * Tm ^ 2 + (coef[5] - coef[6] / (x - coef[8]) ^ 2) * Tm ^ 8) "FF_Wilhoit.ok";
  elseif cor == 7 then
    y := coef[1] + coef[2] * x ^ coef[3] "FF_Cooper.ok";
    for j in {4, 6, 8, 10} loop
      if coef[j] > 0 then
        y := y + coef[j] * (coef[j + 1] / x) ^ 2 * exp(coef[j + 1] / x) / (exp(coef[j + 1] / x) - 1) ^ 2;
      end if;
    end for;
    y := y * R;
  elseif cor == 8 then
    y := 1 + coef[1] "FF_Jaechske.ok";
    for j in {2, 6} loop
      if coef[j] > 0 then
        y := y + coef[j] * (coef[j + 1] / x / sinh(coef[j + 1] / x)) ^ 2 + coef[j + 2] * (coef[j + 3] / x / cosh(coef[j + 3] / x)) ^ 2;
      end if;
    end for;
    y := y * R;
  elseif cor == 9 or cor == 18 or cor == 51 or cor == 62 then
    y := coef[1] + exp(coef[2] / x + coef[3] + coef[4] * x + coef[5] * x ^ 2) "FF_ChemSep16";
  elseif cor == 36 then
    y := 10 ^ (coef[1] - coef[2] / (x + coef[3])) "FF_Antoine1";
  elseif cor == 22 then
    Tm := x - 273.15;
    y := 10 ^ (coef[1] - coef[2] / (Tm + coef[3])) "FF_Antoine1. In deg C";
  elseif cor == 23 then
    y := exp(coef[1] - coef[2] / (x + coef[3])) "FF_Antoine2";
  elseif cor == 24 then
    Tm := 1 - x / coef[6];
    y := coef[1] * exp((coef[2] * Tm + coef[3] * Tm ^ 1.5 + coef[4] * Tm ^ 2.5 + coef[5] * Tm ^ 5.0) / (1 - Tm)) "FF_Wagner25";
  elseif cor == 25 then
    Tm := 1 - x / coef[6];
    y := coef[1] * exp((coef[2] * Tm + coef[3] * Tm ^ 1.5 + coef[4] * Tm ^ 3 + coef[5] * Tm ^ 6) / (1 - Tm)) "FF_Wagner36.ok";
  elseif cor == 26 or cor== 102 then
    Tm := 1 - x / coef[2];
    y := coef[1] * exp(coef[2] * (coef[3] * Tm ^ coef[4] + coef[5] * Tm ^ coef[6] + coef[7] * Tm ^ coef[8] + coef[9] * Tm ^ coef[10] + coef[11] * Tm ^ coef[12] + coef[13] * Tm ^ coef[14]) / x) "FF_ExtWagner";
  elseif cor== 103 then
    Tm := 1 - x / coef[2];
    y := coef[1] * exp(coef[3] * Tm ^ coef[4] + coef[5] * Tm ^ coef[6] + coef[7] * Tm ^ coef[8] + coef[9] * Tm ^ coef[10] + coef[11] * Tm ^ coef[12] + coef[13] * Tm ^ coef[14]) "FF_ExtWagner2";    
  elseif cor == 31 or cor == 33 then
    y := exp(coef[1] + coef[2] / x + coef[3] * x + coef[4] * x ^ 2 + coef[5] * x ^ 3) "FF_ExtAndrade1";
  elseif cor == 32 then
    y := 10 ^ (coef[1] + coef[2] / x + coef[3] * x + coef[4] * x ^ 2 + coef[5] * x ^ 3) "FF_ExtAndrade2";
  elseif cor == 37 then
    y := coef[5] * exp(coef[1] * ((coef[3] - x) / (x - coef[4])) ^ 0.33333 + coef[2] * ((coef[3] - x) / (x - coef[4])) ^ 1.33333) "FF_PPDS9";
  elseif cor == 19 or cor == 151 then
    Tm := 1 - x / coef[6];
    y := coef[1] / Tm + coef[2] + coef[3] * Tm + coef[4] * Tm * Tm + coef[5] * Tm * Tm * Tm "FF_PPDS15.ok";
  elseif cor == 43 then
    y := coef[1] + coef[2] * (1 - x / coef[5]) + coef[3] * log(1 - x / coef[5]) + coef[4] * (1 - x / coef[5]) ^ 3 "FF_PCWIN";
  elseif cor == 48 then
    y := coef[1] / coef[2] ^ ((1 - x / coef[3]) ^ coef[4]) "FF_Rackett";
  elseif cor == 44 or cor == 46 then
    Tm := 1 - x / coef[6];
    y := coef[1] + coef[2] * Tm ^ 0.35 + coef[3] * Tm ^ 0.666667 + coef[4] * Tm + coef[5] * Tm ^ 1.333333 "FF_DIPPR116";
  elseif cor == 101 then
    Tm := 1 - x / coef[6];
    y := coef[1] * exp(coef[2] * Tm ^ 0.4 + coef[3] * Tm + coef[4] * Tm ^ 2.1 + coef[5] * Tm ^ 5.6) "FF_WagnerGd.ok";
  elseif cor == 240 then
    Tm := x - 273.15;
    y := (coef[1] + coef[2] * Tm + coef[3] * Tm ^ 2) * (1 - 0.0894 * log(1 + 1e5 / (coef[4] * exp(-coef[5] * Tm)))) "FF_Tait at 1 bar. T in centigrades";
  elseif cor == 241 then  
    Tm := 1-x/coef[2];
    y := coef[1]*(1+coef[3]*Tm^coef[4]+coef[5]*Tm^coef[6]+coef[7]*Tm^coef[8]+coef[9]*Tm^coef[10]+
                coef[11]*Tm^coef[12]+coef[13]*Tm^coef[14])"FF_ExtLogWagner";
  end if;
  if cor == 1 or cor == 21 or cor == 48 then
    y := y * 1e3;
  elseif cor == 2 or cor == 5 or cor == 7 or cor == 8 or cor == 15 then
    y := y / MW * 1e3;
  elseif cor == 3 or cor == 10 then
    y := y / MW * 1e3 * 4.1868;
  elseif cor == 4 or cor == 9 or cor == 16 or cor == 18 or cor == 80 or cor == 81 or cor == 90 then
    y := y / MW;
  elseif cor == 41 or cor == 44 or cor == 45 or cor == 70 then
    y := y * MW;
  elseif cor == 22 then
    y := y * 133.32239;
  elseif cor == 31 or cor == 32 or cor == 34 or cor == 36 or cor == 63 then
    y := y * 1e-3;
  elseif cor == 33 or cor == 102 or cor== 103 or cor == 241 then
    y := y * MW * 1e-3;
  elseif cor == 49 then
    y := MW * 1e3 / y;
  elseif cor == 240 then
    y := 1 / y;
  end if;
  annotation(
    Documentation(info = "<html>
    <body>
    <p>Provides the calculations of physical properties as function of one independent variable (normally T). It needs as input: the number of the correlation to use, the coefficients for the correlation, the molecular weight of the substance, and the value of the independent variable. It returns the value of the physical property. It has an equivalent written in C inside the FFphysprop.c file in the Resources directory.</p>
    </body>
    </html>"));
end physPropCorr;

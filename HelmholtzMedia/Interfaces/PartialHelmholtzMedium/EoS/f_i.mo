within HelmholtzMedia.Interfaces.PartialHelmholtzMedium.EoS;
function f_i "ideal part of dimensionless Helmholtz energy"

  input Real delta;
  input Real tau;
  output Real f_ideal "ideal part of dimensionless Helmholtz energy";

protected
  constant Integer nLog=size(helmholtzCoefficients.idealLog, 1);
  constant Integer nPower=size(helmholtzCoefficients.idealPower, 1);
  constant Integer nEinstein=size(helmholtzCoefficients.idealEinstein, 1);
  constant Integer nCosh=size(helmholtzCoefficients.idealCosh, 1);
  constant Integer nSinh=size(helmholtzCoefficients.idealSinh, 1);
  //added by CTG
  constant Integer nEinsteinGeneralized=size(helmholtzCoefficients.idealEinsteinGeneralized, 1);
  constant Integer nCpPolyT=size(helmholtzCoefficients.idealCpPolyT, 1);

  constant Real[nLog, 2] l=helmholtzCoefficients.idealLog;
  constant Real[nPower, 2] p=helmholtzCoefficients.idealPower;
  constant Real[nEinstein, 2] e=helmholtzCoefficients.idealEinstein;
  constant Real[nCosh, 2] c=helmholtzCoefficients.idealCosh;
  constant Real[nSinh, 2] s=helmholtzCoefficients.idealSinh;
  //Added by CTG
  constant Real[2] lead=helmholtzCoefficients.lead;
  constant Real[nEinsteinGeneralized, 4] eg=helmholtzCoefficients.idealEinsteinGeneralized;
  constant Real k=helmholtzCoefficients.idealCpConst;
  constant Real[nCpPolyT, 2] cp=helmholtzCoefficients.idealCpPolyT;
  constant Real Tc= if helmholtzCoefficients.Tc> 0 then helmholtzCoefficients.Tc else fluidConstants[1].criticalTemperature;
  constant Real T0=helmholtzCoefficients.T0;

algorithm
  if (delta>0) and (tau>0) then
    f_ideal :=
      log(delta)
      + lead[1]+lead[2]*tau
      + sum(l[i,1]*log(tau^l[i,2]) for i in 1:nLog)
      + sum(p[i,1]*tau^p[i,2] for i in 1:nPower)
      + sum(e[i,1]*log(1 - exp(e[i,2]*tau)) for i in 1:nEinstein)
      + sum(eg[i,1]*log(eg[i,2]+eg[i,3]*exp(eg[i,4]*tau)) for i in 1:nEinsteinGeneralized)
      - sum(c[i,1]*log(abs(cosh(c[i,2]*tau))) for i in 1:nCosh)
      + sum(s[i,1]*log(abs(sinh(s[i,2]*tau))) for i in 1:nSinh)
      +k-k*log(Tc/tau)
      +sum(-cp[i,1]*Tc^cp[i,2]*tau^(-cp[i,2])/((cp[i,2]+1)*cp[i,2]) for i in 1:nCpPolyT);
  else
    f_ideal := -Modelica.Constants.inf;
  end if;
end f_i;

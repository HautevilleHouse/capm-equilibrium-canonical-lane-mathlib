import CapmEquilibriumCanonicalLaneLean.MarketEquilibriumConstruction
import CapmEquilibriumCanonicalLaneLean.RiskPremiumEntropy
import CapmEquilibriumCanonicalLaneLean.CAPMFoundationalTheoremInhabitants

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure EquilibriumRoute (A : AdmissibleClass) where
  construction : MarketEquilibriumConstruction
  entropy : RiskPremiumEntropy
  bridgeClosed : bridgeClosed A
  gateClosed : gateClosed A

theorem equilibrium_route_closes (A : AdmissibleClass) (R : EquilibriumRoute A) : ConstrainedTheoremClosure A :=
  And.intro R.bridgeClosed R.gateClosed

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse

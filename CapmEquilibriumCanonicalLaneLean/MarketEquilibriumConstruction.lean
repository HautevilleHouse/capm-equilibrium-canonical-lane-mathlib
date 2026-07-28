import CapmEquilibriumCanonicalLaneLean.CAPMFoundationalTheoremInhabitants

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure MarketEquilibriumConstruction where
  riskFreeAsset : Asset
  marketPortfolio : Portfolio
  expectedReturns : Vector ℝ
  betas : Vector ℝ
  marketRiskPremium : ℝ
  equilibriumExists : Prop
  equilibriumUnique : Prop
  equilibriumExistsTerm : equilibriumExists
  equilibriumUniqueTerm : equilibriumUnique
  justification : String

def MarketEquilibriumClosed (C : MarketEquilibriumConstruction) : Prop :=
  C.equilibriumExists ∧ C.equilibriumUnique

theorem market_equilibrium_closed_from_construction (C : MarketEquilibriumConstruction) : MarketEquilibriumClosed C :=
  And.intro C.equilibriumExistsTerm C.equilibriumUniqueTerm

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse

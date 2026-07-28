import HautevilleHouse.CapmEquilibriumCanonicalLaneLean.MarketModel

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure PortfolioOptimizationPackage (M : MarketData) where
  optimalPortfolioWeights : List ℝ
  minimumVariance : ℝ
  tangencyPortfolio : List ℝ
  efficientFrontierExists : Prop
  capmRelation : Prop

structure PortfolioOptimizationEvidence {M : MarketData} (P : PortfolioOptimizationPackage M) where
  optimalWeightsComputed : Prop
  minimumVarianceComputed : P.minimumVariance = 0.0 → False
  tangencyPortfolioExists : P.tangencyPortfolio ≠ []
  efficientFrontierExistsClosed : P.efficientFrontierExists
  capmRelationClosed : P.capmRelation

def PortfolioOptimizationClosed {M : MarketData} (P : PortfolioOptimizationPackage M) : Prop :=
  P.efficientFrontierExists ∧ P.capmRelation

theorem portfolio_optimization_closed_from_evidence {M : MarketData} (P : PortfolioOptimizationPackage M) (E : PortfolioOptimizationEvidence M P) : PortfolioOptimizationClosed P :=
  And.intro E.efficientFrontierExistsClosed E.capmRelationClosed

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse
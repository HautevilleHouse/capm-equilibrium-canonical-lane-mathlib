import HautevilleHouse.CapmEquilibriumCanonicalLaneLean.MeanVarianceOptimization

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure EfficientFrontierPackage {M : MarketData} (P : PortfolioOptimizationPackage M) where
  frontierCurve : ℝ → ℝ
  capitalMarketLine : ℝ → ℝ
  marketPortfolioOnFrontier : Prop
  slopeMatchesMarketPriceOfRisk : Prop

structure EfficientFrontierEvidence {M : MarketData} {P : PortfolioOptimizationPackage M} (E : EfficientFrontierPackage P) where
  frontierExists : E.frontierCurve ≠ fun _ => 0
  capitalMarketLineExists : E.capitalMarketLine ≠ fun _ => 0
  marketPortfolioOnFrontierClosed : E.marketPortfolioOnFrontier
  slopeMatchesMarketPriceOfRiskClosed : E.slopeMatchesMarketPriceOfRisk

def EfficientFrontierClosed {M : MarketData} {P : PortfolioOptimizationPackage M} (E : EfficientFrontierPackage P) : Prop :=
  E.marketPortfolioOnFrontier ∧ E.slopeMatchesMarketPriceOfRisk

theorem efficient_frontier_closed_from_evidence {M : MarketData} {P : PortfolioOptimizationPackage M} (E : EfficientFrontierPackage P) (Ev : EfficientFrontierEvidence E) : EfficientFrontierClosed E :=
  And.intro Ev.marketPortfolioOnFrontierClosed Ev.slopeMatchesMarketPriceOfRiskClosed

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse
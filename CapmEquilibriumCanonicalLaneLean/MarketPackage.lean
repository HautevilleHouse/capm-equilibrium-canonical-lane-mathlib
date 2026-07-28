import CapmEquilibriumCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure MarketPackage where
  marketModel : Type u
  numRiskyAssets : Nat
  riskFreeAsset : Prop
  expectedReturns : Prop
  covarianceMatrix : Prop
  marketPortfolioWeight : Prop
  smoothMarket : Prop
  riskFreeRatePositive : Prop
  varianceFinite : Prop
  marketPortfolioEfficient : Prop

structure MarketEvidence (M : MarketPackage) where
  smoothMarketClosed : M.smoothMarket
  riskFreeRatePositiveClosed : M.riskFreeRatePositive
  varianceFiniteClosed : M.varianceFinite
  marketPortfolioEfficientClosed : M.marketPortfolioEfficient

def MarketClosed (M : MarketPackage) : Prop :=
  M.smoothMarket ∧ M.riskFreeRatePositive ∧ M.varianceFinite ∧ M.marketPortfolioEfficient

theorem market_closed_from_evidence (M : MarketPackage) (E : MarketEvidence M) :
    MarketClosed M := by
  exact And.intro E.smoothMarketClosed
    (And.intro E.riskFreeRatePositiveClosed
      (And.intro E.varianceFiniteClosed E.marketPortfolioEfficientClosed))

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse
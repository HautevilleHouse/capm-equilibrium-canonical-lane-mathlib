import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CapmEquilibriumCanonicalLaneLean.MarketPortfolio
import HautevilleHouse.CapmEquilibriumCanonicalLaneLean.RiskFreeAsset
import HautevilleHouse.CapmEquilibriumCanonicalLaneLean.BetaFactor
import HautevilleHouse.CapmEquilibriumCanonicalLaneLean.ExpectedReturn

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure MarketEquilibriumPackage where
  marketPortfolio : MarketPortfolioPackage
  riskFreeAsset : RiskFreeAssetPackage
  betaFactors : List BetaFactorPackage
  expectedReturns : List ExpectedReturnPackage
  equilibriumCondition : Prop
  slopesMatch : Prop

structure MarketEquilibriumEvidence (M : MarketEquilibriumPackage) where
  marketPortfolioClosed : MarketPortfolioClosed M.marketPortfolio
  riskFreeAssetClosed : RiskFreeAssetClosed M.riskFreeAsset
  allBetasClosed : List (BetaFactorPackage) := M.betaFactors
  allBetasClosedProof : ∀ B ∈ M.betaFactors, BetaFactorClosed B
  allExpectedReturnsClosed : ∀ E ∈ M.expectedReturns, ExpectedReturnClosed E
  equilibriumConditionHolds : M.equilibriumCondition
  slopesMatchProof : M.slopesMatch

def MarketEquilibriumClosed (M : MarketEquilibriumPackage) : Prop :=
  MarketPortfolioClosed M.marketPortfolio ∧
  RiskFreeAssetClosed M.riskFreeAsset ∧
  (∀ B ∈ M.betaFactors, BetaFactorClosed B) ∧
  (∀ E ∈ M.expectedReturns, ExpectedReturnClosed E) ∧
  M.equilibriumCondition ∧
  M.slopesMatch

theorem market_equilibrium_closed_from_evidence (M : MarketEquilibriumPackage)
    (Ev : MarketEquilibriumEvidence M) : MarketEquilibriumClosed M := by
  refine And.intro Ev.marketPortfolioClosed
    (And.intro Ev.riskFreeAssetClosed
      (And.intro ?_ (And.intro ?_ (And.intro Ev.equilibriumConditionHolds Ev.slopesMatchProof))))
  · exact Ev.allBetasClosedProof
  · exact Ev.allExpectedReturnsClosed

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse
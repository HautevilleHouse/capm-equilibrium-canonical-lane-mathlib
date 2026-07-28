import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CapmEquilibriumCanonicalLaneLean.MarketPortfolio

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure BetaFactorPackage where
  assetName : String
  beta : ℝ
  covarianceWithMarket : Prop
  marketVariance : Prop
  betaDerived : Prop

structure BetaFactorEvidence (B : BetaFactorPackage) where
  covarianceWithMarketDefined : B.covarianceWithMarket
  marketVarianceDefined : B.marketVariance
  betaDerivedCorrectly : B.betaDerived

def BetaFactorClosed (B : BetaFactorPackage) : Prop :=
  B.covarianceWithMarket ∧ B.marketVariance ∧ B.betaDerived

theorem beta_factor_closed_from_evidence (B : BetaFactorPackage)
    (E : BetaFactorEvidence B) : BetaFactorClosed B := by
  exact And.intro E.covarianceWithMarketDefined
    (And.intro E.marketVarianceDefined E.betaDerivedCorrectly)

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse
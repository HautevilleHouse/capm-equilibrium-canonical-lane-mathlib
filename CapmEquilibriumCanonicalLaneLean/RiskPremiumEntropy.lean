import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure RiskPremiumEntropy where
  marketReturn : ℝ
  riskFreeRate : ℝ
  riskPremium : ℝ
  entropyMeasure : ℝ
  monotonicity : Prop
  lowerBound : Prop
  monotonicityTerm : monotonicity
  lowerBoundTerm : lowerBound

def RiskPremiumEntropyClosed (E : RiskPremiumEntropy) : Prop :=
  E.monotonicity ∧ E.lowerBound

theorem risk_premium_entropy_closed (E : RiskPremiumEntropy) : RiskPremiumEntropyClosed E :=
  And.intro E.monotonicityTerm E.lowerBoundTerm

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse

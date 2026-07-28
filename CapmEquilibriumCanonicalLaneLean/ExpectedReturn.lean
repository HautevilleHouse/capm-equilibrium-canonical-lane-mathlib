import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CapmEquilibriumCanonicalLaneLean.RiskFreeAsset
import HautevilleHouse.CapmEquilibriumCanonicalLaneLean.BetaFactor

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure ExpectedReturnPackage where
  expectedReturn : ℝ
  riskFreeRate : ℝ
  marketPremium : ℝ
  capmRelation : Prop
  formulaValid : Prop

structure ExpectedReturnEvidence (E : ExpectedReturnPackage) where
  riskFreeRateKnown : E.riskFreeRate = 0.02
  marketPremiumKnown : E.marketPremium = 0.05
  capmRelationHolds : E.capmRelation
  formulaValidProof : E.formulaValid

def ExpectedReturnClosed (E : ExpectedReturnPackage) : Prop :=
  E.capmRelation ∧ E.formulaValid

theorem expected_return_closed_from_evidence (E : ExpectedReturnPackage)
    (Ev : ExpectedReturnEvidence E) : ExpectedReturnClosed E := by
  exact And.intro Ev.capmRelationHolds Ev.formulaValidProof

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse
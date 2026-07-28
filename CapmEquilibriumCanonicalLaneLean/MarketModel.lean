import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure MarketData where
  riskFreeRate : ℝ
  expectedReturns : List ℝ
  covarianceMatrix : List (List ℝ)
  numAssets : ℕ
  nonnegativeRates : Prop
  covariancePositiveDefinite : Prop
  expectedReturnsFinite : Prop

structure MarketAdmittedObject where
  market : MarketData
  equilibriumCondition : Prop
  conclusion : equilibriumCondition

structure AdmissibleClass where
  object : MarketAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  equilibriumCondition A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse
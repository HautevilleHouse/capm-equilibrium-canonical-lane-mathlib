import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure CapmAdmittedObject where
  marketModel : Type u
  riskFreeRate : Prop
  riskyAssetReturns : Prop
  marketPortfolio : Prop
  conclusion : Prop

structure AdmissibleClass where
  object : CapmAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CapmWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure AdmissibleClass where
  object : CAPMAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CAPMWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse

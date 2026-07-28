import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CapmEquilibriumCanonicalLaneLean.CapmAdmissibleClass

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse
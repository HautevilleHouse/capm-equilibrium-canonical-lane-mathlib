import CapmEquilibriumCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CapmWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse
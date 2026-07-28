import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CapmEquilibriumCanonicalLaneLean.CapmAdmissibleClass

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  capmProjection A

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse
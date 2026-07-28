import HautevilleHouse.CapmEquilibriumCanonicalLaneLean.EfficientFrontierAndSML

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.equilibriumCondition

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedCapmClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_capm_endgame (A : AdmissibleClass) : ConstrainedCapmClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse
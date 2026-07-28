import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure RiskFreeAssetPackage where
  riskFreeRate : ℝ
  maturity : ℕ
  defaultFree : Prop
  numeraire : Prop

structure RiskFreeAssetEvidence (R : RiskFreeAssetPackage) where
  riskFreeRatePositive : R.riskFreeRate > 0
  maturityFinite : True
  defaultFreeConfirmed : R.defaultFree
  numeraireValid : R.numeraire

def RiskFreeAssetClosed (R : RiskFreeAssetPackage) : Prop :=
  (R.riskFreeRate > 0) ∧ R.defaultFree ∧ R.numeraire

theorem risk_free_asset_closed_from_evidence (R : RiskFreeAssetPackage)
    (E : RiskFreeAssetEvidence R) : RiskFreeAssetClosed R := by
  exact And.intro E.riskFreeRatePositive
    (And.intro E.defaultFreeConfirmed E.numeraireValid)

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure CAPMFoundationalTheoremInhabitants where
  securityMarketLine : Prop
  efficientFrontier : Prop
  tangencyPortfolio : Prop
  zeroBetaCAPM : Prop
  securityMarketLineTerm : securityMarketLine
  efficientFrontierTerm : efficientFrontier
  tangencyPortfolioTerm : tangencyPortfolio
  zeroBetaCAPMTerm : zeroBetaCAPM

data Asset = mk (name : String) (expectedReturn : ℝ) (beta : ℝ)
structure Portfolio where
  weights : Vector ℝ
  assets : List Asset

structure CAPMAdmittedObject where
  assets : List Asset
  marketPortfolio : Portfolio
  riskFreeRate : ℝ
  conclusion : securityMarketLine ∧ efficientFrontier ∧ tangencyPortfolio ∧ zeroBetaCAPM

def CAPMWitnessClosed (O : CAPMAdmittedObject) : Prop :=
  O.conclusion

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse

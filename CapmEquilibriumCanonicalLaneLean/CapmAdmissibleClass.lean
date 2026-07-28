import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure CapmAdmittedObject where
  marketPortfolio : MarketPortfolioPackage
  riskFreeRate : RiskFreeAssetPackage
  betaFactor : BetaFactorPackage
  expectedReturn : ExpectedReturnPackage
  marketEquilibrium : MarketEquilibriumPackage
  conclusion : Prop

def capmProjection (A : AdmissibleClass) : Prop :=
  let O := A.object
  O.conclusion

structure AdmissibleClass where
  object : CapmAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse
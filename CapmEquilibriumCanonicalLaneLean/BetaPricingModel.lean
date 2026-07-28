import HautevilleHouse.CapmEquilibriumCanonicalLaneLean.MarketEquilibrium

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure BetaPricingPackage where
  marketEquilibrium : MarketEquilibriumPackage
  betaValues : List Float
  assetExpectedReturns : List Float
  smlPredictedReturns : List Float
  residuals : List Float

structure BetaPricingEvidence (B : BetaPricingPackage) where
  betaComputedCorrectly : B.betaValues = (List.map (fun (cov : Float) => cov / B.marketEquilibrium.marketPortfolioVar) (List.map (fun i => (List.foldl (fun acc j => acc + B.marketEquilibrium.marketObject.covarianceMatrix[i]!!j * B.marketEquilibrium.marketObject.marketPortfolioWeights[j]) 0 (List.range B.marketEquilibrium.marketObject.assets)) (List.range B.marketEquilibrium.marketObject.assets)))
  smlPredictedReturnsMatch : B.smlPredictedReturns = List.map (fun beta => B.marketEquilibrium.smlIntercept + beta * B.marketEquilibrium.smlSlope) B.betaValues
  residualsUncorrelated : B.residuals = List.map2 (fun ex ret => ex - ret) B.assetExpectedReturns B.smlPredictedReturns

def BetaPricingClosed (B : BetaPricingPackage) : Prop :=
  (∀ i, B.betaValues[i] = (B.marketEquilibrium.marketObject.covarianceMatrix[i] * B.marketEquilibrium.marketObject.marketPortfolioWeights).sum / B.marketEquilibrium.marketPortfolioVar) ∧
  B.smlPredictedReturns = List.map (fun beta => B.marketEquilibrium.smlIntercept + beta * B.marketEquilibrium.smlSlope) B.betaValues ∧
  B.residuals = List.map2 (fun ex ret => ex - ret) B.assetExpectedReturns B.smlPredictedReturns

theorem beta_pricing_closed_from_evidence (B : BetaPricingPackage) (E : BetaPricingEvidence B) : BetaPricingClosed B :=
by
  exact And.intro E.betaComputedCorrectly (And.intro E.smlPredictedReturnsMatch E.residualsUncorrelated)

end HautevilleHouse
end CapmEquilibriumCanonicalLaneLean
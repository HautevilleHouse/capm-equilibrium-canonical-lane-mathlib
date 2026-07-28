import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic
import Mathlib.LinearAlgebra.Matrix

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure CapmMarket (n : Nat) where
  riskyAssets : n → Type
  riskFreeAsset : Type
  expectedReturns : n → ℝ
  covarianceMatrix : Matrix (Fin n) (Fin n) ℝ
  marketPortfolioWeights : Fin n → ℝ
  riskFreeRate : ℝ
  weightSumOne : (∑ i : Fin n, marketPortfolioWeights i) = 1
  covariancePosSemidef : Matrix.PosSemidef covarianceMatrix

def marketReturn (n : Nat) (m : CapmMarket n) : ℝ :=
  ∑ i : Fin n, m.marketPortfolioWeights i * m.expectedReturns i

def beta (n : Nat) (m : CapmMarket n) (i : Fin n) : ℝ :=
  (∑ j : Fin n, m.covarianceMatrix i j * m.marketPortfolioWeights j) /
  (∑ j : Fin n, ∑ k : Fin n, m.marketPortfolioWeights j * m.covarianceMatrix j k * m.marketPortfolioWeights k)

structure CapmAdmittedObject (n : Nat) where
  market : CapmMarket n
  capmHolds : ∀ i : Fin n, m.expectedReturns i - m.riskFreeRate = beta n m i * (marketReturn n m - m.riskFreeRate)
    where m := market

def capmWitnessClosed (n : Nat) (O : CapmAdmittedObject n) : Prop :=
  O.capmHolds

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse
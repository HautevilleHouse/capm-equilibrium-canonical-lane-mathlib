import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure MarketPortfolioPackage where
  portfolioWeights : Type u
  expectedReturn : Prop
  variance : Prop
  covarianceMatrix : Prop
  efficientFrontier : Prop

structure MarketPortfolioEvidence (P : MarketPortfolioPackage) where
  portfolioWeightsDefined : True
  expectedReturnComputed : P.expectedReturn
  varianceComputed : P.variance
  covarianceMatrixDefined : P.covarianceMatrix
  efficientFrontierDerived : P.efficientFrontier

def MarketPortfolioClosed (P : MarketPortfolioPackage) : Prop :=
  P.expectedReturn ∧ P.variance ∧ P.covarianceMatrix ∧ P.efficientFrontier

theorem market_portfolio_closed_from_evidence (P : MarketPortfolioPackage)
    (E : MarketPortfolioEvidence P) : MarketPortfolioClosed P := by
  exact And.intro E.expectedReturnComputed
    (And.intro E.varianceComputed
      (And.intro E.covarianceMatrixDefined E.efficientFrontierDerived))

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse
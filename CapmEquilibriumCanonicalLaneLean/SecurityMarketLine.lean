import HautevilleHouse.CapmEquilibriumCanonicalLaneLean.BetaPricingModel

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure SecurityMarketLinePackage where
  betaPricing : BetaPricingPackage
  slmLineEquation : String
  allAssetsOnLine : Prop
  marketPortfolioOnLine : Prop

structure SecurityMarketLineEvidence (S : SecurityMarketLinePackage) where
  slmLineEquationDefined : S.slmLineEquation = "E(R_i) = R_f + beta_i * (E(R_m) - R_f)"
  allAssetsOnLineClosed : S.allAssetsOnLine
  marketPortfolioOnLineClosed : S.marketPortfolioOnLine

def SecurityMarketLineClosed (S : SecurityMarketLinePackage) : Prop :=
  S.slmLineEquation = "E(R_i) = R_f + beta_i * (E(R_m) - R_f)" ∧
  S.allAssetsOnLine ∧
  S.marketPortfolioOnLine

theorem security_market_line_closed_from_evidence (S : SecurityMarketLinePackage) (E : SecurityMarketLineEvidence S) : SecurityMarketLineClosed S :=
by
  exact And.intro E.slmLineEquationDefined (And.intro E.allAssetsOnLineClosed E.marketPortfolioOnLineClosed)

end HautevilleHouse
end CapmEquilibriumCanonicalLaneLean
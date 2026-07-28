import CapmEquilibriumCanonicalLaneLean.MarketPackage

namespace HautevilleHouse
namespace CapmEquilibriumCanonicalLaneLean

structure EquilibriumModel {M : MarketPackage} where
  betaVectors : Type u
  securityMarketLine : Prop
  equilibriumPrices : Prop
  zeroBetaPortfolio : Prop
  betaRepresentation : Prop

structure EquilibriumEvidence {M : MarketPackage} (E : EquilibriumModel M) where
  securityMarketLineClosed : E.securityMarketLine
  equilibriumPricesClosed : E.equilibriumPrices
  zeroBetaPortfolioClosed : E.zeroBetaPortfolio
  betaRepresentationClosed : E.betaRepresentation

def EquilibriumClosed {M : MarketPackage} (E : EquilibriumModel M) : Prop :=
  E.securityMarketLine ∧ E.equilibriumPrices ∧ E.zeroBetaPortfolio ∧ E.betaRepresentation

theorem equilibrium_closed_from_evidence {M : MarketPackage}
    (E : EquilibriumModel M) (Ev : EquilibriumEvidence E) :
    EquilibriumClosed E := by
  exact And.intro Ev.securityMarketLineClosed
    (And.intro Ev.equilibriumPricesClosed
      (And.intro Ev.zeroBetaPortfolioClosed Ev.betaRepresentationClosed))

end CapmEquilibriumCanonicalLaneLean
end HautevilleHouse
import HautevilleHouse.BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean

structure BlasiusPackage where
  similaritySolution : Prop
  odeDerived : Prop
  boundaryConditions : Prop
  profileValid : Prop

structure BlasiusEvidence (B : BlasiusPackage) where
  similaritySolutionClosed : B.similaritySolution
  odeDerivedClosed : B.odeDerived
  boundaryConditionsClosed : B.boundaryConditions
  profileValidClosed : B.profileValid

def BlasiusClosed (B : BlasiusPackage) : Prop :=
  B.similaritySolution ∧ B.odeDerived ∧ B.boundaryConditions ∧ B.profileValid

theorem blasius_closed_from_evidence (B : BlasiusPackage) (E : BlasiusEvidence B) : BlasiusClosed B := by
  exact And.intro E.similaritySolutionClosed
    (And.intro E.odeDerivedClosed
      (And.intro E.boundaryConditionsClosed E.profileValidClosed))

end BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean
end HautevilleHouse

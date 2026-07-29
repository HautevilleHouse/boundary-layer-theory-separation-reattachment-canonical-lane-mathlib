import HautevilleHouse.BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean.FalknerSkanSystem

namespace HautevilleHouse
namespace BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean

structure SeparationCriterionPackage {B : BlasiusPackage} {F : FalknerSkanPackage B} where
  zeroWallShearStress : Prop
  adversePressureGradient : Prop
  separationPointDetected : Prop
  reattachmentCondition : Prop

structure SeparationCriterionEvidence {B : BlasiusPackage} {F : FalknerSkanPackage B} (S : SeparationCriterionPackage F) where
  zeroWallShearStressClosed : S.zeroWallShearStress
  adversePressureGradientClosed : S.adversePressureGradient
  separationPointDetectedClosed : S.separationPointDetected
  reattachmentConditionClosed : S.reattachmentCondition

def SeparationCriterionClosed {B : BlasiusPackage} {F : FalknerSkanPackage B} (S : SeparationCriterionPackage F) : Prop :=
  S.zeroWallShearStress ∧ S.adversePressureGradient ∧ S.separationPointDetected ∧ S.reattachmentCondition

theorem separation_criterion_closed_from_evidence {B : BlasiusPackage} {F : FalknerSkanPackage B} (S : SeparationCriterionPackage F) (E : SeparationCriterionEvidence S) : SeparationCriterionClosed S := by
  exact And.intro E.zeroWallShearStressClosed
    (And.intro E.adversePressureGradientClosed
      (And.intro E.separationPointDetectedClosed E.reattachmentConditionClosed))

end BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean
end HautevilleHouse

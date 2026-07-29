import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean

structure PrandtlBoundaryLayerPackage where
  velocityField : Type
  pressureDistribution : Type
  boundaryLayerThickness : ℝ
  displacementThickness : ℝ
  momentumThickness : ℝ
  shapeFactor : ℝ
  separationCriterion : Prop
  reattachmentCondition : Prop

structure PrandtlBoundaryLayerEvidence (P : PrandtlBoundaryLayerPackage) where
  velocityFieldDefined : P.velocityField = P.velocityField
  pressureDistributionDefined : P.pressureDistribution = P.pressureDistribution
  boundaryLayerThicknessPos : P.boundaryLayerThickness > 0
  displacementThicknessPos : P.displacementThickness > 0
  momentumThicknessPos : P.momentumThickness > 0
  shapeFactorRange : P.shapeFactor > 2.0 ∧ P.shapeFactor < 4.0
  separationCriterionClosed : P.separationCriterion
  reattachmentConditionClosed : P.reattachmentCondition

def PrandtlBoundaryLayerClosed (P : PrandtlBoundaryLayerPackage) : Prop :=
  P.separationCriterion ∧ P.reattachmentCondition

theorem prandtl_boundary_layer_closed_from_evidence
    (P : PrandtlBoundaryLayerPackage) (E : PrandtlBoundaryLayerEvidence P) :
    PrandtlBoundaryLayerClosed P := by
  exact And.intro E.separationCriterionClosed E.reattachmentConditionClosed

end BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean
end HautevilleHouse
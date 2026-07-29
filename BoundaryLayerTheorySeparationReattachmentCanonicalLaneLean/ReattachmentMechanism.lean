import BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean.SeparationDynamics

namespace HautevilleHouse
namespace BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean

structure ReattachmentPackage where
  reattachmentPoint : ℝ
  pressureRecovery : ℝ
  boundaryLayerThickness : ℝ → ℝ
  wallShearStressReattachment : ℝ
  attachedFlowCondition : Prop

structure ReattachmentEvidence (R : ReattachmentPackage) where
  reattachmentPointFinite : R.reattachmentPoint < ∞
  pressureRecoveryPositive : R.pressureRecovery > 0
  boundaryLayerThicknessPositive : ∀ x, R.boundaryLayerThickness x > 0
  wallShearStressReattachmentPositive : R.wallShearStressReattachment > 0
  attachedFlowConditionClosed : R.attachedFlowCondition

def ReattachmentClosed (R : ReattachmentPackage) : Prop :=
  R.reattachmentPoint < ∞ ∧ R.pressureRecovery > 0 ∧
  (∀ x, R.boundaryLayerThickness x > 0) ∧
  R.wallShearStressReattachment > 0 ∧ R.attachedFlowCondition

theorem reattachment_closed_from_evidence (R : ReattachmentPackage)
    (E : ReattachmentEvidence R) : ReattachmentClosed R := by
  exact And.intro E.reattachmentPointFinite
    (And.intro E.pressureRecoveryPositive
      (And.intro E.boundaryLayerThicknessPositive
        (And.intro E.wallShearStressReattachmentPositive
          E.attachedFlowConditionClosed)))

end BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean
end HautevilleHouse
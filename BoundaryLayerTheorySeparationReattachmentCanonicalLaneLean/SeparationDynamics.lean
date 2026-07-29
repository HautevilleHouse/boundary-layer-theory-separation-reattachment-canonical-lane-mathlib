import BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean.BoundaryLayerAdmissibleClass

namespace HautevilleHouse
namespace BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean

structure SeparationBubblePackage where
  bubbleLength : ℝ
  bubbleHeight : ℝ
  recirculationZone : Prop
  reversedFlowVelocity : ℝ → ℝ
  turbulentTransition : Prop

structure SeparationBubbleEvidence (S : SeparationBubblePackage) where
  bubbleLengthPositive : S.bubbleLength > 0
  bubbleHeightPositive : S.bubbleHeight > 0
  recirculationZoneClosed : S.recirculationZone
  reversedFlowVelocityClosed : S.reversedFlowVelocity 0 = 0
  turbulentTransitionClosed : S.turbulentTransition

def SeparationBubbleClosed (S : SeparationBubblePackage) : Prop :=
  S.bubbleLength > 0 ∧ S.bubbleHeight > 0 ∧ S.recirculationZone ∧
  (∃ x, S.reversedFlowVelocity x < 0) ∧ S.turbulentTransition

theorem separation_bubble_closed_from_evidence (S : SeparationBubblePackage)
    (E : SeparationBubbleEvidence S) : SeparationBubbleClosed S := by
  refine And.intro E.bubbleLengthPositive ?_
  refine And.intro E.bubbleHeightPositive ?_
  refine And.intro E.recirculationZoneClosed ?_
  refine And.intro ?_ E.turbulentTransitionClosed
  exact ⟨0, by simpa using E.reversedFlowVelocityClosed⟩

end BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean
end HautevilleHouse
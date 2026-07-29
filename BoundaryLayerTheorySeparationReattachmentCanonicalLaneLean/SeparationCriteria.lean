import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean

structure SeparationCriteriaPackage where
  adversePressureGradient : Prop
  wallShearStressZero : Prop
  flowReversal : Prop
  separationPointPredicted : Prop

structure SeparationCriteriaEvidence (S : SeparationCriteriaPackage) where
  adversePressureGradientClosed : S.adversePressureGradient
  wallShearStressZeroClosed : S.wallShearStressZero
  flowReversalClosed : S.flowReversal
  separationPointPredictedClosed : S.separationPointPredicted

def SeparationCriteriaClosed (S : SeparationCriteriaPackage) : Prop :=
  S.adversePressureGradient ∧ S.wallShearStressZero ∧ S.flowReversal ∧ S.separationPointPredicted

theorem separation_criteria_closed_from_evidence
  (S : SeparationCriteriaPackage) (E : SeparationCriteriaEvidence S) :
  SeparationCriteriaClosed S := by
  exact And.intro E.adversePressureGradientClosed
    (And.intro E.wallShearStressZeroClosed
      (And.intro E.flowReversalClosed E.separationPointPredictedClosed))

end BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean
end HautevilleHouse
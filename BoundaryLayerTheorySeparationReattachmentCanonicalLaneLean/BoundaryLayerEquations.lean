import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean

structure BoundaryLayerFlow where
  freestreamVelocity : ℝ
  pressureGradient : ℝ
  ReynoldsNumber : ℝ
  boundaryLayerThickness : ℝ
  separationPoint : Option ℝ
  reattachmentPoint : Option ℝ

structure BoundaryLayerEquations where
  continuityEquation : Prop
  momentumEquation : Prop
  energyEquation : Prop
  prandtlEquationsValid : Prop

structure BoundaryLayerEquationsEvidence (E : BoundaryLayerEquations) where
  continuityEquationClosed : E.continuityEquation
  momentumEquationClosed : E.momentumEquation
  energyEquationClosed : E.energyEquation
  prandtlEquationsValidClosed : E.prandtlEquationsValid

def BoundaryLayerEquationsClosed (E : BoundaryLayerEquations) : Prop :=
  E.continuityEquation ∧ E.momentumEquation ∧ E.energyEquation ∧ E.prandtlEquationsValid

theorem boundary_layer_equations_closed_from_evidence
    (E : BoundaryLayerEquations) (Ev : BoundaryLayerEquationsEvidence E) :
    BoundaryLayerEquationsClosed E := by
  exact And.intro Ev.continuityEquationClosed
    (And.intro Ev.momentumEquationClosed
      (And.intro Ev.energyEquationClosed Ev.prandtlEquationsValidClosed))

structure SeparationCriterion where
  adversePressureGradientThreshold : ℝ
  wallShearStressZero : Prop
  flowReversalDetected : Prop

structure SeparationCriterionEvidence (S : SeparationCriterion) where
  adversePressureGradientThresholdClosed : S.adversePressureGradientThreshold > 0
  wallShearStressZeroClosed : S.wallShearStressZero
  flowReversalDetectedClosed : S.flowReversalDetected

def SeparationCriterionClosed (S : SeparationCriterion) : Prop :=
  S.adversePressureGradientThreshold > 0 ∧ S.wallShearStressZero ∧ S.flowReversalDetected

theorem separation_criterion_closed_from_evidence
    (S : SeparationCriterion) (Ev : SeparationCriterionEvidence S) :
    SeparationCriterionClosed S := by
  exact And.intro Ev.adversePressureGradientThresholdClosed
    (And.intro Ev.wallShearStressZeroClosed Ev.flowReversalDetectedClosed)

structure ReattachmentCondition where
  reattachmentLength : ℝ
  pressureRecovery : Prop
  boundaryLayerReattachment : Prop

structure ReattachmentConditionEvidence (R : ReattachmentCondition) where
  reattachmentLengthClosed : R.reattachmentLength > 0
  pressureRecoveryClosed : R.pressureRecovery
  boundaryLayerReattachmentClosed : R.boundaryLayerReattachment

def ReattachmentConditionClosed (R : ReattachmentCondition) : Prop :=
  R.reattachmentLength > 0 ∧ R.pressureRecovery ∧ R.boundaryLayerReattachment

theorem reattachment_condition_closed_from_evidence
    (R : ReattachmentCondition) (Ev : ReattachmentConditionEvidence R) :
    ReattachmentConditionClosed R := by
  exact And.intro Ev.reattachmentLengthClosed
    (And.intro Ev.pressureRecoveryClosed Ev.boundaryLayerReattachmentClosed)

end BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean
end HautevilleHouse
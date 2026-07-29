import BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean.SeparationCriteria

namespace HautevilleHouse
namespace BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean

structure MomentumIntegralPackage where
  integralEquation : Prop
  velocityProfile : Type
  shapeFactorCorrelation : Prop
  separationPrediction : Prop

structure MomentumIntegralEvidence (M : MomentumIntegralPackage) where
  integralEquationClosed : M.integralEquation
  velocityProfileDefined : M.velocityProfile = M.velocityProfile
  shapeFactorCorrelationClosed : M.shapeFactorCorrelation
  separationPredictionClosed : M.separationPrediction

def MomentumIntegralClosed (M : MomentumIntegralPackage) : Prop :=
  M.integralEquation ∧ M.separationPrediction

theorem momentum_integral_closed_from_evidence
    (M : MomentumIntegralPackage) (E : MomentumIntegralEvidence M) :
    MomentumIntegralClosed M := by
  exact And.intro E.integralEquationClosed E.separationPredictionClosed

end BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean
end HautevilleHouse
import HautevilleHouse.BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean.BlasiusProfile

namespace HautevilleHouse
namespace BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean

structure FalknerSkanPackage (B : BlasiusPackage) where
  wedgeAngle : Prop
  pressureGradientParameter : Prop
  equation : Prop
  velocityProfile : Prop

structure FalknerSkanEvidence {B : BlasiusPackage} (F : FalknerSkanPackage B) where
  wedgeAngleClosed : F.wedgeAngle
  pressureGradientParameterClosed : F.pressureGradientParameter
  equationClosed : F.equation
  velocityProfileClosed : F.velocityProfile

def FalknerSkanClosed {B : BlasiusPackage} (F : FalknerSkanPackage B) : Prop :=
  F.wedgeAngle ∧ F.pressureGradientParameter ∧ F.equation ∧ F.velocityProfile

theorem falkner_skan_closed_from_evidence {B : BlasiusPackage} (F : FalknerSkanPackage B) (E : FalknerSkanEvidence F) : FalknerSkanClosed F := by
  exact And.intro E.wedgeAngleClosed
    (And.intro E.pressureGradientParameterClosed
      (And.intro E.equationClosed E.velocityProfileClosed))

end BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean

structure BoundaryLayerObject where
  region : Type
  wallCoordinates : region → Type
  velocityProfile : region → ℝ → ℝ
  pressureGradient : region → ℝ
  wallShearStress : region → ℝ
  separationThreshold : ℝ
  conclusion : separationThreshold > 0

structure AdmissibleClass where
  object : BoundaryLayerObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean
end HautevilleHouse
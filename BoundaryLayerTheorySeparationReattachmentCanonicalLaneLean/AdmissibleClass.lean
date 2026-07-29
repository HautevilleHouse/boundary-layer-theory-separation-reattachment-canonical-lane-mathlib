import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean

structure BoundaryLayerFlowObject where
  domain : Type
  inflowVelocityProfile : Type
  separationPoint : Type
  reattachmentPoint : Type
  boundaryLayerThickness : Type
  conclusion : Prop

structure AdmissibleClass where
  object : BoundaryLayerFlowObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.conclusion) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean.SeparationReattachmentBridge

namespace HautevilleHouse
namespace BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean

def ConstrainedBoundaryLayerClosure (A : BoundaryLayerAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_boundary_layer_endgame (A : BoundaryLayerAdmissibleClass) :
    ConstrainedBoundaryLayerClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean
end HautevilleHouse
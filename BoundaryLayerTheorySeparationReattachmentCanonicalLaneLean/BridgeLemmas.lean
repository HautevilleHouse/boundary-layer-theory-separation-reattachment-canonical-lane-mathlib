import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.conclusion

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean
end HautevilleHouse
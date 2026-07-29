import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean

structure ReattachmentZonePackage where
  reattachmentLength : Prop
  pressureRecovery : Prop
  boundaryLayerRelaminarization : Prop
  reattachmentPointValidated : Prop

structure ReattachmentZoneEvidence (Z : ReattachmentZonePackage) where
  reattachmentLengthClosed : Z.reattachmentLength
  pressureRecoveryClosed : Z.pressureRecovery
  boundaryLayerRelaminarizationClosed : Z.boundaryLayerRelaminarization
  reattachmentPointValidatedClosed : Z.reattachmentPointValidated

def ReattachmentZoneClosed (Z : ReattachmentZonePackage) : Prop :=
  Z.reattachmentLength ∧ Z.pressureRecovery ∧ Z.boundaryLayerRelaminarization ∧ Z.reattachmentPointValidated

theorem reattachment_zone_closed_from_evidence
  (Z : ReattachmentZonePackage) (E : ReattachmentZoneEvidence Z) :
  ReattachmentZoneClosed Z := by
  exact And.intro E.reattachmentLengthClosed
    (And.intro E.pressureRecoveryClosed
      (And.intro E.boundaryLayerRelaminarizationClosed E.reattachmentPointValidatedClosed))

end BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean

inductive FlowRegime where
  | laminar
  | transitional
  | turbulent

define FlowModelPackage where
  freeStreamTurbulenceLevel : Float
  pressureGradientParameter : Float
  reynoldsNumberRange : Float × Float
  wallRoughness : Float
  regime : FlowRegime

structure FlowModelEvidence (M : FlowModelPackage) where
  freeStreamTurbulenceLevelClosed : M.freeStreamTurbulenceLevel > 0
  pressureGradientParameterClosed : M.pressureGradientParameter ≠ 0
  reynoldsNumberRangeClosed : Prod.fst M.reynoldsNumberRange < Prod.snd M.reynoldsNumberRange
  wallRoughnessClosed : M.wallRoughness ≥ 0
  regimeConsistent : M.regime = FlowRegime.laminar ∨ M.regime = FlowRegime.turbulent

def FlowModelClosed (M : FlowModelPackage) : Prop :=
  M.freeStreamTurbulenceLevel > 0 ∧ M.pressureGradientParameter ≠ 0 ∧
  Prod.fst M.reynoldsNumberRange < Prod.snd M.reynoldsNumberRange ∧
  M.wallRoughness ≥ 0 ∧
  (M.regime = FlowRegime.laminar ∨ M.regime = FlowRegime.turbulent)

theorem flow_model_closed_from_evidence (M : FlowModelPackage)
    (E : FlowModelEvidence M) : FlowModelClosed M := by
  exact And.intro E.freeStreamTurbulenceLevelClosed
    (And.intro E.pressureGradientParameterClosed
      (And.intro E.reynoldsNumberRangeClosed
        (And.intro E.wallRoughnessClosed E.regimeConsistent)))

end BoundaryLayerTheorySeparationReattachmentCanonicalLaneLean
end HautevilleHouse
import FWCore.ParameterSet.Config as cms

generator = cms.EDFilter("Pythia8GeneratorFilter",
    maxEventsToPrint = cms.untracked.int32(1),
    pythiaPylistVerbosity = cms.untracked.int32(1),
    filterEfficiency = cms.untracked.double(1.0),
    pythiaHepMCVerbosity = cms.untracked.bool(True),
    comEnergy = cms.double(13000.),

    PythiaParameters = cms.PSet(
        py8DiffSettings = cms.vstring(
                        'Diffraction:hardDiffSide = 0',
                        'Diffraction:doHard = on',
                        'Diffraction:sampleType = 3', # Dynamic gap. Use 3 (MPI-unchecked) or 4 (MPI-checked). Options 1 or 2 will generate diffractive and non-diffractive inclusive events.
                        'SigmaDiffractive:PomFlux = 7', # H1 Fit B parametrisation
                        'PDF:PomSet = 6'  # 6 -> H1 2006 Fit B LO, 4 -> H1 2006 Fit B NLO
        ),
        py8ProcessSettings = cms.vstring(
            'WeakSingleBoson:ffbar2gmZ = on',
            'PhaseSpace:pTHatMin = 20.', # changing pT
            '23:onMode = off',
            '23:onIfAny = 13' # pdgid(13): Muon, pdgid(11): Electron
        ),
        parameterSets = cms.vstring( 'py8DiffSettings',
                                     'py8ProcessSettings'
                                   )
    )
)

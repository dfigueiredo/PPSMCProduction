import FWCore.ParameterSet.Config as cms

generator = cms.EDFilter("Pythia8GeneratorFilter",
    maxEventsToPrint = cms.untracked.int32(1),
    pythiaPylistVerbosity = cms.untracked.int32(1),
    filterEfficiency = cms.untracked.double(1.0),
    pythiaHepMCVerbosity = cms.untracked.bool(True),
    comEnergy = cms.double(13000.),

    PythiaParameters = cms.PSet(
        py8DiffSettings = cms.vstring(
                        'HardQCD:all = on',
                        'Diffraction:hardDiffSide = 0',
                        'PhaseSpace:pTHatMin = 80.', # changing top pT
                        'Diffraction:doHard = on',
                        'Diffraction:sampleType = 3', # Dynamic gap. Use 3 (MPI-unchecked) or 4 (MPI-checked). Options 1 or 2 will generate diffractive and non-diffractive inclusive events.
                        'SigmaDiffractive:PomFlux = 7', # H1 Fit B parametrisation
                        'PDF:PomSet = 6'  # 6 -> H1 2006 Fit B LO, 4 -> H1 2006 Fit B NLO
        ),
        py8ProcessSettings = cms.vstring(
                        'WeakSingleBoson:ffbar2gmZ = on',
                        '23:onMode = off',
                        '23:onIfAny = 13 -13',
                        '23:onIfAny = 11 -11'


        ),
        parameterSets = cms.vstring( 'py8DiffSettings',
                                     'py8ProcessSettings'
                                   )
    )
)

import FWCore.ParameterSet.Config as cms

herwig6Parameters = cms.PSet(
	comEnergy = cms.double(13000.0),
	useJimmy = cms.bool(False),
	doMPInteraction = cms.bool(False),

	herwigHepMCVerbosity = cms.untracked.bool(False),
	herwigVerbosity = cms.untracked.int32(1),
	printCards = cms.untracked.bool(True),
	maxEventsToPrint = cms.untracked.int32(2),

	crossSection = cms.untracked.double(-1.0),
	filterEfficiency = cms.untracked.double(1.0),
)

source = cms.Source("EmptySource")
 
generator = cms.EDFilter("PomwigGeneratorFilter",
    herwig6Parameters,
    HerwigParameters = cms.PSet(
        parameterSets = cms.vstring('SDInclusiveWmunu'),
        SDInclusiveWmunu = cms.vstring('NSTRU      = 14         ! H1 Pomeron Fit B', 
            'Q2WWMN     = 1E-6       ! Minimum |t|', 
            'Q2WWMX     = 4.0        ! Maximum |t|', 
            'YWWMIN     = 1E-6       ! Minimum xi', 
            'YWWMAX     = 0.2        ! Maximum xi', 
            'IPROC      = 11451      ! Process PomP -> W -> Enu',
            'MODPDF(1)  = 10150      ! Set MODPDF CTEQ61', 
            'MODPDF(2)  = -1         ! Set MODPDF')
    ),
    diffTopology = cms.int32(2),
    survivalProbability = cms.double(0.05),
    h1fit = cms.int32(2),
    doPDGConvert = cms.bool(False)
)

ProductionFilterSequence = cms.Sequence(generator)

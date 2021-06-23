# PPSMCProduction

This package is used to produce a private CMSSW Monte-Carlo (MC) dataset. Scripts are based on McM instructions from official campaigns and cmsDriver commands to generate the config files.
For the crab jobs submission, the package [JobSubmitter](https://github.com/dfigueiredo/JobSubmitter) can be used.

## Installation

Download the package from git. After running the script to set the environment, there are dedicated scripts for each production (from pythia, exhume, pomwig or directly from LHE files). 

```bash
git clone https://github.com/dfigueiredo/PPSMCProduction
cd PPSMCProduction
source set_environment.sh
PREPAREMCGENERATION <enter> (only for the first time to create your working folder)
```

## Usage

```bash
cd PPSMCProduction/
cd working/
source step[1-6]*.sh 
```

The script will download the needed CMSSW version and produce the config file using cmsDriver. For the LHE file produced from your own Toy MC or tuned MC (first step of the generation), it is adviced to copy it to eos for further use with crab. For more instructions, check the [package](https://github.com/dfigueiredo/JobSubmitter). Different MC configs and flags are placed on "MCProduction/Configuration/". 

## Private Production

| Monte-Carlo       | Script | Event Content |
| ------------- |:-------------:|-------------:|
| pythia      | source step1-pythia.sh | GEN |
| ExHume      | source step1-exhume.sh | GEN |
| pomwig      | source step1-pomwig.sh | GEN |
| LHE Toy MC   | source step1-LHEGEN.sh | LHE, GEN |

All the other scripts are common for both MC productions. Please, note that for LHE Toy MC, two configurations will be generated in the first step script. The first CMSSW configuration file  produces an EDM "LHEProducer" collection and the second CMSSW configuration file produces the GEN.



#!/bin/bash

# Make voms proxy
voms-proxy-init --voms cms --out $(pwd)/voms_proxy.txt --hours 4
export X509_USER_PROXY=$(pwd)/voms_proxy.txt

export SCRAM_ARCH=slc7_amd64_gcc700

source /cvmfs/cms.cern.ch/cmsset_default.sh
if [ -r CMSSW_10_6_20/src ] ; then
  echo release CMSSW_10_6_20 already exists
else
  scram p CMSSW CMSSW_10_6_20
fi
cd CMSSW_10_6_20/src
eval `scram runtime -sh`

scram b
cd ../..

EVENTS=8400

# cmsDriver command
cmsDriver.py  --python_filename PPS-RunIISummer20UL18MiniAODv2-00003_1_cfg.py --eventcontent MINIAODSIM --customise Configuration/DataProcessing/Utils.addMonitoring --datatier MINIAODSIM --fileout file:PPS-RunIISummer20UL18MiniAODv2-00003.root --conditions 106X_upgrade2018_realistic_v16_L1v1 --step PAT --procModifiers run2_miniAOD_UL --geometry DB:Extended --filein file:PPS-RunIISummer20UL18RECO-00001.root --era Run2_2018 --runUnscheduled --no_exec --mc -n $EVENTS || exit $? ;

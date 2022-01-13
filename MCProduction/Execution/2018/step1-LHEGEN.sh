#!/bin/bash

# Make voms proxy
voms-proxy-init --voms cms --out $(pwd)/voms_proxy.txt --hours 4
export X509_USER_PROXY=$(pwd)/voms_proxy.txt

export SCRAM_ARCH=slc7_amd64_gcc700

source /cvmfs/cms.cern.ch/cmsset_default.sh
if [ -r CMSSW_10_6_21/src ] ; then
  echo release CMSSW_10_6_21 already exists
else
  scram p CMSSW CMSSW_10_6_21
fi
cd CMSSW_10_6_21/src
eval `scram runtime -sh`


# Official CMS Producion

# Download fragment from McM
curl -s -k https://cms-pdmv.cern.ch/mcm/public/restapi/requests/get_fragment/PPS-RunIISummer20UL18pLHEGEN-00001 --retry 3 --create-dirs -o Configuration/GenProduction/python/PPS-RunIISummer20UL18pLHEGEN-00001-fragment.py
[ -s Configuration/GenProduction/python/PPS-RunIISummer20UL18pLHEGEN-00001-fragment.py ] || exit $?;
scram b
cd ../..

EVENTS=1000

# cmsDriver command, LHE

# S->XZ /eos/cms/store/group/phys_exotica/PPS-Exo/LHESource/toy_mc_pps_XZ.lhe
# S->XH /eos/cms/store/group/phys_exotica/PPS-Exo/LHESource/toy_mc_pps_XH.lhe

cmsDriver.py Configuration/GenProduction/python/PPS-RunIISummer20UL18pLHEGEN-00001-fragment.py --python_filename PPS-RunIISummer20UL18pLHEGEN-00001_1_toyXZ_cfg.py --eventcontent LHE --customise Configuration/DataProcessing/Utils.addMonitoring --datatier LHE --fileout file:PPS-RunIISummer20UL18pLHEGEN-00001_0.root --conditions 106X_upgrade2018_realistic_v4 --step NONE --filein "/store/group/phys_exotica/PPS-Exo/LHESource/toy_mc_pps_XZ.lhe" --era Run2_2018 --no_exec --mc -n $EVENTS || exit $? ;

cmsDriver.py Configuration/GenProduction/python/PPS-RunIISummer20UL18pLHEGEN-00001-fragment.py --python_filename PPS-RunIISummer20UL18pLHEGEN-00001_1_toyXH_cfg.py --eventcontent LHE --customise Configuration/DataProcessing/Utils.addMonitoring --datatier LHE --fileout file:PPS-RunIISummer20UL18pLHEGEN-00001_0.root --conditions 106X_upgrade2018_realistic_v4 --step NONE --filein "/store/group/phys_exotica/PPS-Exo/LHESource/toy_mc_pps_XH.lhe" --era Run2_2018 --no_exec --mc -n $EVENTS || exit $? ;

# cmsDriver command, GEN
cmsDriver.py Configuration/GenProduction/python/PPS-RunIISummer20UL18pLHEGEN-00001-fragment.py --python_filename PPS-RunIISummer20UL18pLHEGEN-00001_2_cfg.py --eventcontent RAWSIM --customise Configuration/DataProcessing/Utils.addMonitoring --datatier GEN --fileout file:PPS-RunIISummer20UL18pLHEGEN-00001.root --conditions 106X_upgrade2018_realistic_v4 --beamspot Realistic25ns13TeVEarly2018Collision --step GEN --geometry DB:Extended --filein file:PPS-RunIISummer20UL18pLHEGEN-00001_0.root --era Run2_2018 --no_exec --mc -n $EVENTS

#!/bin/bash
# set_environment.sh - preparing framework environment under GPL v2+
#-------------------------------------------------------------------

export PPSFRAMEWORKROOT=`pwd`
export WORKINGPPSDIR2017=$PPSFRAMEWORKROOT/working2017
export WORKINGPPSDIR2018=$PPSFRAMEWORKROOT/working2018

if [ -d $WORKINGPPSDIR2017 ]
then 
   echo -e "\n$WORKINGPPSDIR2017 is present. Nothing is needed to do.\n"
else
   echo -e "\nCreating a working dir.\n"
   mkdir $PPSFRAMEWORKROOT/working2017
   echo -e "\nChecking: $WORKINGPPSDIR2017\n"
fi

if [ -d $WORKINGPPSDIR2018 ]
then
   echo -e "\n$WORKINGPPSDIR2018 is present. Nothing is needed to do.\n"
else
   echo -e "\nCreating a working dir.\n"
   mkdir $PPSFRAMEWORKROOT/working2018
   echo -e "\nChecking: $WORKINGPPSDIR2018\n"
fi

alias PREPAREMCGENERATION2017="cp $PPSFRAMEWORKROOT/MCProduction/Execution/2017/*.sh $WORKINGPPSDIR2017/." 
alias PREPAREMCGENERATION2018="cp $PPSFRAMEWORKROOT/MCProduction/Execution/2018/*.sh $WORKINGPPSDIR2018/." 

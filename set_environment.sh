#!/bin/bash
# set_environment.sh - preparing framework environment under GPL v2+
#-------------------------------------------------------------------

export PPSFRAMEWORKROOT=`pwd`
export WORKINGPPSDIR=$PPSFRAMEWORKROOT/working

#if [-d "$WORKINGPPSDIR" -a ! -h "$WORKINGPPSDIR"]
if [ -d $WORKINGPPSDIR ]
then 
   echo -e "\n$WORKINGPPSDIR is present. Nothing is needed to do.\n"
else
   echo -e "\nCreating a working dir.\n"
   mkdir $PPSFRAMEWORKROOT/working
   echo -e "\nChecking: $WORKINGPPSDIR\n"
fi

alias PREPAREMCGENERATION2017="cp $PPSFRAMEWORKROOT/MCProduction/Execution/2017/*.sh $WORKINGPPSDIR/." 
alias PREPAREMCGENERATION2018="cp $PPSFRAMEWORKROOT/MCProduction/Execution/2018/*.sh $WORKINGPPSDIR/." 

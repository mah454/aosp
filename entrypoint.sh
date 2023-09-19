#!/bin/bash 

source /aosp/build/envsetup.sh

lunch

if [[ ! -z $COMPILE_JOB_COUNT ]] && [[ $COMPILE_JOB_COUNT -gt $(nproc) ]] ; then
    make -j$(nproc)
else 
    make -j $AOSP_JOB_COUNT
fi

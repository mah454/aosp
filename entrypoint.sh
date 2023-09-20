#!/bin/bash 

source /aosp/build/envsetup.sh
set_stuff_for_environment 
lunch

if [[ ! -z $COMPILE_JOB_COUNT ]] && [[ $COMPILE_JOB_COUNT -gt $(nproc) ]] ; then
    make -j$(nproc) 
    make -j$(nproc) dist
else 
    make -j $AOSP_JOB_COUNT 
    make -j $AOSP_JOB_COUNT  dist
fi

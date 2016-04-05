#!/bin/bash

. scripts/dev/_cases.sh
. scripts/dev/_votes.sh

if [[ ! $ENV ]] ; then 
    ENV='dev'
fi

cases
votes
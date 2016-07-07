#!/bin/bash

. scripts/dev/_cases.sh
. scripts/dev/_courts.sh
. scripts/dev/_justices.sh
. scripts/dev/_overrides.sh
. scripts/dev/_views.sh
. scripts/dev/_votes.sh

if [[ ! $ENV ]] ; then 
    ENV='dev'
fi

cases
votes
justices
justice_scores
justice_terms
terms
courts
naturalcourts
overrides
views
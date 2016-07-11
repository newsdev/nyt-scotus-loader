#!/bin/bash

. scripts/prd/_cases.sh
. scripts/prd/_courts.sh
. scripts/prd/_justices.sh
. scripts/prd/_overrides.sh
. scripts/prd/_views.sh
. scripts/prd/_votes.sh

if [[ ! $ENV ]] ; then 
    ENV='prd'
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
#!/bin/bash

if [[ ! $ENV ]] ; then 
    ENV='prd'
fi

function create_database {
    if psql -lqt | cut -d \| -f 1 | grep -qw nyt_scotus_$ENV; then
        echo "nyt_scotus_$ENV exists, skipping"
    else
        createdb nyt_scotus_$ENV
        echo "created nyt_scotus_$ENV"
    fi
}

function create_user {
    createuser -s nyt_scotus > /dev/null 2>&1
    psql postgres -c "alter user nyt_scotus with superuser;"
}

create_user
create_database
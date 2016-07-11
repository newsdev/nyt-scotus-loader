#!/bin/bash

function cases {
    cat fields/cases.txt | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd
    clerk cases -o csv | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd -c "COPY cases FROM stdin DELIMITER ',' CSV HEADER;"
}
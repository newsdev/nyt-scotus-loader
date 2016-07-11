#!/bin/bash

function courts {
    cat fields/courts.txt | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd
    clerk courts -o csv | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd -c "COPY courts FROM stdin DELIMITER ',' CSV HEADER;"
}

function naturalcourts {
    echo "Copying distinct naturalcourts from SCDB data to a naturalcourt table."
    cat fields/naturalcourt.txt | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd
    psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd -c "COPY (select distinct naturalcourt, chief from cases) TO stdout;" | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd -c "COPY naturalcourts FROM stdin;"
}
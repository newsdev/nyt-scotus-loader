#!/bin/bash

function courts {
    cat fields/courts.txt | psql nyt_scotus_$ENV
    clerk courts -o csv | psql nyt_scotus_$ENV -c "COPY courts FROM stdin DELIMITER ',' CSV HEADER;"
}

function naturalcourts {
    echo "Copying distinct naturalcourts from SCDB data to a naturalcourt table."
    cat fields/naturalcourt.txt | psql nyt_scotus_$ENV
    psql nyt_scotus_$ENV -c "COPY (select distinct naturalcourt, chief from cases) TO stdout;" | psql nyt_scotus_$ENV -c "COPY naturalcourts FROM stdin;"
}
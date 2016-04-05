#!/bin/bash

function cases {
    cat fields/cases.txt | psql nyt_scotus_$ENV
    clerk cases -o csv | psql nyt_scotus_$ENV -c "COPY cases FROM stdin DELIMITER ',' CSV HEADER;"
}
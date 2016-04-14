#!/bin/bash

function justices {
    echo "Copying distinct justices from SCDB data to a justice table."
    cat fields/justices.txt | psql nyt_scotus_$ENV
    psql nyt_scotus_$ENV -c "COPY (select distinct justice, justicename from votes) TO stdout;" | psql nyt_scotus_$ENV -c "COPY justices FROM stdin;"
}

function justice_scores {
    cat fields/justice_scores.txt | psql nyt_scotus_$ENV
    clerk justices -o csv | psql nyt_scotus_$ENV -c "COPY justice_scores FROM stdin DELIMITER ',' CSV HEADER;"
}

function terms {
    echo "Copying distinct terms from Martin-Quinn data to a terms table."
    cat fields/terms.txt | psql nyt_scotus_$ENV
    psql nyt_scotus_$ENV -c "COPY (select distinct term from justice_terms) TO stdout;" | psql nyt_scotus_$ENV -c "copy terms FROM stdin;"
}

function justice_terms {
    cat fields/justice_terms.txt | psql nyt_scotus_$ENV
    clerk terms -o csv | psql nyt_scotus_$ENV -c "copy justice_terms from stdin DELIMITER ',' CSV HEADER;"
}
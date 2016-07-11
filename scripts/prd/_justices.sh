#!/bin/bash

function justices {
    echo "Copying distinct justices from SCDB data to a justice table."
    cat fields/justices.txt | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd
    psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd -c "COPY (select distinct justice, justicename from votes) TO stdout;" | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd -c "COPY justices FROM stdin;"
}

function justice_scores {
    cat fields/justice_scores.txt | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd
    clerk justices -o csv | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd -c "COPY justice_scores FROM stdin DELIMITER ',' CSV HEADER;"
}

function terms {
    echo "Copying distinct terms from Martin-Quinn data to a terms table."
    cat fields/terms.txt | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd
    psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd -c "COPY (select distinct term from justice_terms) TO stdout;" | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd -c "copy terms FROM stdin;"
}

function justice_terms {
    cat fields/justice_terms.txt | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd
    clerk terms -o csv | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd -c "copy justice_terms from stdin DELIMITER ',' CSV HEADER;"
}
function votes {
    cat fields/votes.txt | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd
    clerk votes -o csv | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd -c "COPY votes FROM stdin DELIMITER ',' CSV HEADER;"
}
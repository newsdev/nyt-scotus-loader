function votes {
    cat fields/votes.txt | psql nyt_scotus_$ENV
    clerk votes -o csv | psql nyt_scotus_$ENV -c "COPY votes FROM stdin DELIMITER ',' CSV HEADER;"
}
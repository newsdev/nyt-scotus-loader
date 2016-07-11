function overrides {
    cat fields/override_cases.txt | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_$ENV
    cat fields/override_justices.txt | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_$ENV
}

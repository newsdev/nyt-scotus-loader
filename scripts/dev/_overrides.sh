function overrides {
    cat fields/override_cases.txt | psql nyt_scotus_$ENV
    cat fields/override_justices.txt | psql nyt_scotus_$ENV
}

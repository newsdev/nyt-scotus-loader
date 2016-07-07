function views {
    echo "Creating views."
    cat fields/nyt_justices.txt | psql -d nyt_scotus_$ENV
    cat fields/scotus_cases.txt | psql nyt_scotus_$ENV
    cat fields/scotus_votes.txt | psql nyt_scotus_$ENV
    cat fields/scotus_justices.txt | psql nyt_scotus_$ENV
}
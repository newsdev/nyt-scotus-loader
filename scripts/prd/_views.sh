function views {
    echo "Creating views."
    cat fields/nyt_justices.txt | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd
    cat fields/scotus_cases.txt | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd
    cat fields/scotus_votes.txt | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd
    cat fields/scotus_justices.txt | psql -h $ELEX_DB_HOST -U nyt_scotus -d nyt_scotus_prd
}
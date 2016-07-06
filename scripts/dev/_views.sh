function views {
    echo "Creating views."
    cat fields/nyt_justices.txt | psql -d nyt_scotus_$ENV
}
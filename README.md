# NYT SCOTUS Loader
A set of bash scripts that wrap [nyt-docket]() and [nyt-clerk]() for loading historical and current SCOTUS data into a Postgres database.

## Getting started
```
git clone git@github.com:newsdev/nyt-scotus-loader.git && cd nyt-scotus-loader
mkvirtualenv nyt-scotus-loader && pip install -r requirements.txt
./scripts/dev/bootstrap.sh
./scripts/dev/reload.sh
```

## Scripts

### Bootstrap
Creates the database and database user for SCOTUS data.

### Reload
Downloads, parses and copies case, justice and term data from the SCDB, Martin-Quinn score and Segal-Cover score repositories.
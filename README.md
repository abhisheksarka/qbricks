# qubricks
# Requirements
* Postgres 11.2 
* Ruby 2.5.1 
* Rails 5.2.2

# Set up
`git clone git@github.com:abhisheksarka/qubricks.git`
`cd catalyst`
`bundle install`
`bundle exec rake db:setup`
`psql qubricks_dev < dump.pgsql`
`rails s`

# Running the Automation

`localhost:4000/sites`
`Click on view/edit`
`Click on run`
`Copy sample.json to the dataset field`
`Click Start Browser`


# Important
After making a change to anything in the db make sure you dump it out from the root directory to the file `dump.pgsql`
`pg_dump -U user qubricks_dev > dump.pgsql`
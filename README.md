# qubricks
# Requirements
* Postgres 11.2 
* Ruby 2.5.1 
* Rails 5.2.2

# Set up
`git clone git@github.com:abhisheksarka/qubricks.git`

`cd catalyst`

`bundle`

`bundle exec rake db:setup`

`apply pg dump using the dump file in the root directory`

`rails s`


# Important
After making a change to anything in the db make sure you dump it out from the root directory to the file `dump.pgsql`
`pg_dump -U db_user db_name > dump.pgsql`
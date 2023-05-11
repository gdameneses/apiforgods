This is an app that consumes GitHub API to list and show information about 5 most starred repos of Ruby, Haskell, C, JavaScript and Python.

Ruby version: 3.2.2
Rails version: 7.0.4

Gems: Simpleform, HTTParty and dotenv-rails.
Database: PostgreSQL

Configuration
- clone the repo
- run bundle install
- run a postgres server locally
- run rails db:migrate
- generate a github api token with read access to repositories
- create a ".env" file, on the root path of the app with this line:
    GH_ACCESS_TOKEN=[YOUR_TOKEN_HERE]
  
Send your token to the deploy service that you want to use and keep the same variable name, otherwise you won't be able to make the requests.

To see it's live version running, check on http://http://icertus-challenge-backend.herokuapp.com

Thanks for checking it out!

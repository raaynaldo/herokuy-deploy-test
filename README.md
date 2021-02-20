# Deploy Ruby API to Heroku (ruby-2.6.1)

## Add Procfile and Procfile.dev in Rails Project
Create `Procfile` and `Procfile.dev` inside the root folder
```
# root/Procfile
web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV
release: bundle exec rails db:migrate
release: bundle exec rails db:seed
# db:seed is optional, if you use db:seed it will reseed data every time you push)
# add any other commands
```

![procfile](https://raw.githubusercontent.com/raaynaldo/herokuy-deploy-test/main/screen-shoot/procfile.png)

Push the changes.

## Install Heroku CLI

Follow this [documentation](https://devcenter.heroku.com/articles/heroku-cli#getting-started).

## Create New App

Run this command in inside rails folder
```
heroku create --stack heroku-18
```
*I'm using heroku-18 stack because my ruby version is `ruby-2.6.1`.*

Change the heroku app name (optional)
```
heroku apps:rename herokuy-deploy-test
```

## Go to Heroku Dashboard

Heroku App will be available.
![heroku-dashborad](https://raw.githubusercontent.com/raaynaldo/herokuy-deploy-test/main/screen-shoot/heroku-dashboard.png)

- Click the new app and choose `deploy` section.
- Connect with your github repository. 
![connect-github](https://raw.githubusercontent.com/raaynaldo/herokuy-deploy-test/main/screen-shoot/connect-github.png)
- Turn on `Enable Automatic Deploys`
![enable-automatic-deploys](https://raw.githubusercontent.com/raaynaldo/herokuy-deploy-test/main/screen-shoot/enable-automatic-deploys.png)
- Choose a branch to deploy, and Deploy Branch.
![deploy-branch](https://raw.githubusercontent.com/raaynaldo/herokuy-deploy-test/main/screen-shoot/deploy-branch.png)

## Try my Rails API

- [https://herokuy-deploy-test.herokuapp.com/api/v1/users](https://herokuy-deploy-test.herokuapp.com/api/v1/users)
- [https://herokuy-deploy-test.herokuapp.com/api/v1/posts](https://herokuy-deploy-test.herokuapp.com/api/v1/posts)

## Bonus: Set Origin CORS Dynamically (On Development or On Production)

```rb
# config/environments/development.rb
Rails.application.configure do
    ...

    # cors origns
    config.allowed_cors_origins = "*"
end
```

```rb
# config/environments/production.rb
Rails.application.configure do
    ...

    # cors origns
    config.allowed_cors_origins = "front-end link without http://"
end
```

```rb
# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
        origins Rails.application.config.allowed_cors_origins

        ...
    end
end
```
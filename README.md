# Deploy Ruby API to Heroku (ruby-2.6.1)

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

## Add Procfile and Procfile.dev in Rails Project
Create `Procfile` and `Procfile.dev` inside the root folder
```
# root/Procfile
web: rails server
release: bundle exec rails db:migrate
release: bundle exec rails db:seed
# add any other commands
```

```
# root/Procfile.dev
web: bundle exec rails server

# I just follow other tutorial
```

![procfile](https://raw.githubusercontent.com/raaynaldo/herokuy-deploy-test/main/screen-shoot/procfile.png)

Push the changes to the branch that you chose before.

## Try my Rails API

- [https://herokuy-deploy-test.herokuapp.com/api/v1/users](https://herokuy-deploy-test.herokuapp.com/api/v1/users)
- [https://herokuy-deploy-test.herokuapp.com/api/v1/posts](https://herokuy-deploy-test.herokuapp.com/api/v1/posts)
# BIGGROUPS

#### URL
http://biggroups.herokuapp.com/
#### About
BigGroups is an online directory of restaurants and bars that are good for big groups (think birthday parties, special dinners, or maybe you just have lots of friends). The restaurants and bars are submitted by people like you who are members of BigGroups.co. 
#### Set Up

```sh
$ git clone https://github.com/gitlaura/final.git
$ cd final
$ bundle install
$ rake db:migrate
$ rake db:seed
```
#### Play Around
If you want to log in, there are two dummy user names:
  - taylor.swift@gmail.com, pw: test
  - beyonce@gmail.com, pw: test

#### Database
BigGroups is using sqlite3 in development and postgreSQL in test and production. This shouldn't affect your use in development. 
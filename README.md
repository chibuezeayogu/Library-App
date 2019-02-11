[![CircleCI](https://circleci.com/gh/chibuezeayogu/Library-App.svg?style=svg)](https://circleci.com/gh/chibuezeayogu/Library-App) [![Maintainability](https://api.codeclimate.com/v1/badges/7aaa3ab8b684af003550/maintainability)](https://codeclimate.com/github/chibuezeayogu/Library-App/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/7aaa3ab8b684af003550/test_coverage)](https://codeclimate.com/github/chibuezeayogu/Library-App/test_coverage)

# Library-App
A simple Library-app API that allows a user signup, signin, view all available books, borrow a book/books and return it within a specified period of time. When a user fails to return the book within the time frame, he/she will pay a fine.

# External Dependencies
This web application is written with Ruby using the Ruby on Rails framework and a PostgreSQL database. You need Ruby version 2.4.1 for the application to work
* To install rvm , visit [RVM](https://rvm.io/rvm/install)
* To install this ruby version, you can run the command below but you can use other channels to install it as well e.g. rbenv. 
* To install PostgreSQL, run 
```bash
brew install postgres
```
# Installation
Please make sure you have **Ruby(v 2.4.1) and PostgreSQL** installed. Take the following steps to setup the application on your local machine:

1. Run `git clone https://github.com/chibuezeayogu/Library-App.git` to clone this repository

2. Run the command `cd Library-App` to checkout into `Library-App`.

2. Run `bundle install` to install all required gems

*Note* Update the postgres username and password if you have one

# Configuring the database
* To create application database, run:
    ```bash
    rails db:create
    ```
* Next run the code below to migrate schemas that might have not been added to the database

    ```bash
    rails db:schema:load
    ```
# Tests
* Run test with `rspec`

# Limitations
* Library App is still in development.

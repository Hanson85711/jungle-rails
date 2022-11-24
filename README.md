# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example. Application simulates an online shop for plants. Has functionalities of category based product listing, real time cart updates, transaction process, admin-side product and category creation, and user authentication. 

## Screenshots 
!["Homepage of app"](https://github.com/Hanson85711/jungle-rails/blob/master/app/assets/images/Home%20page.png)
!["Example of product category"](https://github.com/Hanson85711/jungle-rails/blob/master/app/assets/images/Shrubs%20Product%20Catalogue.png)
!["User Cart Example"](https://github.com/Hanson85711/jungle-rails/blob/master/app/assets/images/Cart%20Example.png)
!["Admin Page Example"](https://github.com/Hanson85711/jungle-rails/blob/master/app/assets/images/Admin%20Page.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

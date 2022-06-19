# Mario's Specialty Food Products

#### By Kyle Miller

## Technologies Used

* Ruby-on-Rails
* Ruby Gems: Rspec, Pry, Capybara, Faker, shoulda-matchers, Devise 
* HTML
* Postgres
* PSQL 

## Description:
_This application was created to demonstrate my understanding of one-to-many relationship between Products and Reviews using authentication, scopes, validations, callbacks, seeding, and flash messages._

## Setup/Installation Requirements for Windows

* Clone or download this repository onto your desktop.
* Navigate to the top-level of directory.
* Open VScode.
* Type "bundle" to install the gems
* In `Config/database.yml` file, add username & password to the `development:`, `test:`, & `production:`
* An Example:  
```
development:
  <<: *default
database: marios-food_development
username: <%= ENV['POSTGRES_USERNAME'] %> 
password: <%= ENV['POSTGRES_PASSWORD'] %> 
```
* **To Run Tests**: In the root directory of this project, run `rspec` in your command line.
* **To Run the App in Browser**: 
  1. `rake db:create`
  2. `rake db:test:prepare`
  3. `rake db:migrate`
  4. `rake db:seed`
  5. Run `pg_ctl start` in the terminal to run a server. 
  6. Then run `rails s` to start up rails, which you can access by entering `localhost:3000` in your browser.

## Admin Setup 
* Create a User on the web page
* Connect to Rails console (_Type in terminal_)
```
rails c
```
* Select the user
```
@user = User.last
```
* Give the user admin controls
```
@user.admin = true
```
* Save the changes to the user
```
@user.save
```
## Known Bugs

- _N/A_

## License

- N/A Copyright (c) 6/18/2022, Kyle Miller
- _[MIT](https://opensource.org/licenses/MIT)_
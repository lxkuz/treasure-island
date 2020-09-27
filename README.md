# README

* Ruby version
2.7.1 (installed via RVM)

* NodeJS version
v14.0.0 (installed via NVM)

* SQLite version
3.28.0

## How To Start

`bundle install`
`bundle exec rake db:create db:migrate db:seed`
`bundle exec rails s`

Open: `http://localhost:3000`

Open `http://localhost:3000/api/v1/site_map` for API endpoint check

## Testing

We use capybara with crome driver testing. Steps to enable this stuff for Mac OS:

1) Install Chrome web browser if you don't have it
2) Download chromedriver from https://chromedriver.storage.googleapis.com/index.html (85's folders for Chrome 85)
3) Save it into some path, for example:
`/usr/local/Caskroom/chromedriver/85.0.4183.87/chromedriver`
4) Setup this path into `.env` file, `CHROME_DRIVER_PATH` variable
5) Mark driver as verified for Mac OS `xattr -d com.apple.quarantine chromedriver` (into the driver folder)
6) To run spec:
`RAILS_ENV=test bundle exec rspec spec`
7) Then to check tests coverage:
`open coverage/index.html`

It will open browser during testing and apply Javascript for end-to-end testing of site map.

## Linters

ESLint: `yarn run eslint app/javascripts`
Rubocop: `bundle exec rubocop .`
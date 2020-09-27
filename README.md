# README

* Ruby version
2.7.1 (installed via RVM)

* NodeJS version
v14.0.0 (installed via NVM)

* SQLite version
3.28.0

## Decisions

`Page` model stores every site map node. Page has name, path, full_path, key and timestamp attributes.

API endpoint `api/v1/site_map` returns JSON with tree structure built on top of `Page` records.

Here is the example of such structure:
```JSON
{
  "nodes": {
    "settings": {
      "path": "/settings",
      "key": "home.settings",
      "name": "Settings",
      "nodes": {
        "company_profile": {
          "path": "/settings/company_profile",
          "key": "home.settings.company_profile",
          "name": "Company Profile",
          "nodes": {
            
          }
        }
      }
    }
  },
  "path": "/",
  "key": "home",
  "name": "Home"
}
```

React component `SiteMap` gets this data from useFetch hook (useEffect on fetch function).
When data is ready it renders components tree on top of it. Every node renders via `SiteNode` component.

If we change `path` or `name` of parent `Page` it leads to all children update in order to compose correct full path and IDs for everyone.

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

4) Create `.env` file based on `.env.example`, setup correct `CHROME_DRIVER_PATH` variable as chromedriver full path
5) Mark driver as verified for Mac OS `xattr -d com.apple.quarantine chromedriver` (into the driver folder)
6) Run tests:

`RAILS_ENV=test bundle exec rspec spec`

It will open browser during testing and apply Javascript for end-to-end testing of site map.
7) Then to check tests coverage:
`open coverage/index.html`



## Linters

ESLint: `yarn run eslint app/javascripts`
Rubocop: `bundle exec rubocop .`

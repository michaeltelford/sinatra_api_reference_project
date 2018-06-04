# Sinatra API Reference Project

Sinatra app composing of controller and model layers. You can easily add a view layer if you wish to; this is simply a starting point by providing an out-of-the-box API server application.

Feel free to clone or fork the repo to use this as a starting point for your own projects.

## Configured Tech

- [`sinatra`](http://sinatrarb.com/) - pre-configured web app
- [`activerecord`](http://guides.rubyonrails.org/active_record_basics.html) - model layer for querying postgres
- [`rack-reducer`](https://github.com/chrisfrank/rack-reducer) - lib for easily querying models using URL query params
- `docker` and `docker-compose` - for virtualisation

## Usage

### ENV

Create an `.env` file at the root of the repo and add the below variables to it. Any values not provided have sensible defaults applied in `app/app.rb`. The variables will automatically be loaded into the `ENV` at runtime (or via the `dotenv` rake task).

```bash
DEV_PORT=8080
PORT=7000

DB_ADAPTER=postgresql
DB_DATABASE=app
DB_HOST=db
DB_PORT=5432
DB_USERNAME=postgres
DB_PASSWORD=postgres
```

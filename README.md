# DOWLA ASSESSMENT

## Time API

This is a simple Sinatra application that provides a RESTful API endpoint to retrieve the current time in UTC format, with an optional parameter to adjust the time to a specified timezone.

### Endpoint

#### GET /time

- Returns the current time in UTC format.
- Accepts an optional query parameter:
  - `timezone`: A string representing a valid timezone offset.

### Usage

To run the application locally, follow these steps:

1. Install Ruby (if not already installed).
2. Install dependencies using Bundler: `bundle install`.
3. Start the Sinatra server: `ruby app.rb`.
4. Access the API endpoint in your browser or using tools like cURL or Postman:
   - `http://localhost:4567/time`
   - `http://localhost:4567/time?timezone=America/Los_Angeles`

### Testing

This project includes RSpec tests to verify the functionality of the API. To run the tests, execute `rspec spec/app_spec.rb` in your terminal.

### Dependencies

- Sinatra: Web application framework
- Rack-Test: Testing framework for Rack-based web applications
- JSON: Library for parsing and generating JSON data

### Author

Roosevelt Jackson

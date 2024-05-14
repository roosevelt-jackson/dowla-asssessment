require_relative '../app.rb'
require 'rack/test'

RSpec.describe 'Time API' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context 'GET /time' do
    it 'returns current time in UTC format' do
      get '/time'
      expect(last_response.status).to eq(200)
      json_response = JSON.parse(last_response.body)
      expect(json_response).to have_key('currentTime')
      expect(json_response['currentTime']).to match(/\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z/)
    end

    it 'returns adjusted time if timezone parameter is provided' do
      get '/time?timezone=America/Los_Angeles'
      expect(last_response.status).to eq(200)
      json_response = JSON.parse(last_response.body)
      expect(json_response).to have_key('currentTime')
      expect(json_response).to have_key('adjustedTime')
      expect(json_response['adjustedTime']).to match(/\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}[\+\-]\d{2}:\d{2}/)
    end

    it 'returns error if invalid timezone parameter is provided' do
      get '/time?timezone=invalid'
      expect(last_response.status).to eq(400)
      json_response = JSON.parse(last_response.body)
      expect(json_response).to have_key('error')
      expect(json_response['error']).to eq('Invalid timezone: invalid')
    end
  end
end

require 'sinatra'
require 'json'
require 'tzinfo'

get '/time' do
  content_type :json
  
  current_time_utc = Time.now.utc.iso8601

  if timezone = params['timezone']
    begin
      tz = TZInfo::Timezone.get(timezone)

      {
        currentTime: current_time_utc,
        adjustedTime: tz.utc_to_local(Time.now.utc).iso8601 
      }.to_json
    rescue Exception => e
      status 400

      { 
        error: "Invalid timezone: #{timezone}"
      }.to_json
    end
  else
    {
      currentTime: current_time_utc
    }.to_json
  end
end

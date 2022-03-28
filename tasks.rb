require 'sinatra'
require 'opentelemetry/sdk'
require 'opentelemetry/exporter/otlp'
require 'opentelemetry/instrumentation/sinatra'
require 'opentelemetry/instrumentation/net/http'

OpenTelemetry::SDK.configure do |c|
  c.service_name = 'tasks'
  c.use 'OpenTelemetry::Instrumentation::Sinatra'
  c.use 'OpenTelemetry::Instrumentation::Net::HTTP'
end

get '/tasks' do
  Net::HTTP.get_response(URI('http://localhost:4568/users'))
  "Tasks"
end

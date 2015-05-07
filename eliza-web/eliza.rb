require_relative 'lib/eliza_questions'
require 'rack'

app = Proc.new do |env|
  # puts env
  # puts req
  ['200', {'Content-Type' => 'text/html'}, ["
    <form action='POST'>
    <input class='text' name='user_input'><br>
    <button type='submit' >OK</input>"]]
    # response = Rack::Request.new
    if env['QUERY_STRING'] == nil
      response = 'woah'.to_a
    else
      response = [env['QUERY_STRING']]
    puts Response.get_answer response
    end
end

Rack::Handler::WEBrick.run app

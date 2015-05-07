require_relative 'lib/eliza_questions'
require 'rack'

def create_html
  "<form action='POST'><input class='text name='user_input'></input><br><button type='submit'>Ok</button>"
end

def handled_response response_hash
  @value = response_hash[:user_input] unless response_hash.nil?
  app_response @value
end

def app_response value
  puts Response.get_answer value
end


app = Proc.new do |env|
  # puts env
  # puts req
  req = Rack::Request.new env
  # puts req.post?
  # puts req.params
  puts
  puts req.params.inspect
  puts
  # puts req.form_data?
  @response = req.params.inspect
  ['200', {'Content-Type' => 'text/html'}, create_html  ]
    # response = Rack::Request.new
    # if env['QUERY_STRING'] == nil
    #   response = 'woah'.to_a
    # else
    #   response = [env['QUERY_STRING']]
    # end
  # if @response == nil
  #   # do something
  # else
  #   puts Response.get_answer @response
  # end
end

Rack::Handler::WEBrick.run app

require_relative 'lib/eliza_questions'
require 'rack'

app = Proc.new do |env|
  req = Rack::Request.new env
  user_entered = req.params['user_input']
  response = Response.get_answer user_entered unless user_entered == nil

  [200, {'Content-Type' => 'text/html'}, ["
    <p>#{user_entered}</p><br>
    <p>.....#{response}</p>
    <form method='POST'>
    <p><input class='textarea' name='user_input' style='width:200'></input></p><br>
    <button type='submit' >OK</input>"]]
end

Rack::Handler::WEBrick.run app

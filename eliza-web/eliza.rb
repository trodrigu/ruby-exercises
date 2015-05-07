require_relative 'lib/eliza_questions'
# require 'rack/lobster'
require 'rack'
# def create_html
#   return "<form action='POST'><input class='text name='user_input'></input><br><button type='submit'>Ok</button>"
# end
#
# def handled_response response_hash
#   @value = response_hash[:user_input] unless response_hash.nil?
#   app_response @value
# end
#
# def app_response value
#   puts Response.get_answer value
# end
#
# puts @user_input

# app = Proc.new do |env|
#   req = Rack::Request.new env
#   puts Response.get_answer req.params['user_input']
#   ['200', {'Content-Type' => 'text/html'}, ['<form><input name=\'user_input\'><button type=\'submit\'>Click This</button></from>']  ]
# end
#
# Rack::Handler::WEBrick.run app
# LobsterString = Zlib::Inflate.inflate("eJx9kEEOwyAMBO99xd7MAcytUhPlJyj2
# P6jy9i4k9EQyGAnBarEXeCBqSkntNXsi/ZCvC48zGQoZKikGrFMZvgS5ZHd+aGWVuWwhVF0
# t1drVmiR42HcWNz5w3QanT+2gIvTVCiE1lm1Y0eU4JGmIIbaKwextKn8rvW+p5PIwFl8ZWJ
# I8jyiTlhTcYXkekJAzTyYN6E08A+dk8voBkAVTJQ==".delete("\n ").unpack("m*")[0])
#
# LambdaLobster = lambda { |env|
#   if env['QUERY_STRING'].include?("flip")
#     lobster = LobsterString.split("\n").
#       map { |line| line.ljust(42).reverse }.
#       join("\n")
#     href = "?"
#   else
#     lobster = LobsterString
#     href = "?flip"
#   end
#
#   content = ["<title>Lobstericious!</title>",
#              "<pre>", lobster, "</pre>",
#              "<a href='#{href}'>flip!</a>"]
#   length = content.inject(0) { |a,e| a+e.size }.to_s
#   [200, {'CONTENT_TYPE' => "text/html", 'CONTENT_LENGTH' => length}, content]
# }


LambdaEliza = lambda { |env|
# if env['QUERY_STRING'].include?('')
#   puts "Can't do it on nothing"
# else
  # content += "<span>#{Response.get_answer env['QUERY_STRING']}</span>"
# end
  puts env['QUERY_STRING']

# content = [
#             "<title>Eliza doesn't know</title>",
#             "<pre>What does Eliza think?</pre>",
#             "<input type='text' name='user_input'>",
#             "<button type='submit'>Click me</button>"
#             ]
#
content = ['<form><input name=\'user_input\'><button type=\'submit\'>Click This</button></form>']

            length = content.inject(0) { |a,e| a+e.size }.to_s
            [200, {'CONTENT_TYPE' => "text/html", 'CONTENT_LENGTH' => length}, content]

}
app = Rack::Builder.app do
  use Rack::CommonLogger
  run lambda { |env| [200, {'Content-Type' => 'text/plain'}, ['OK']] }
  # run LambdaEliza
end

Rack::Handler::WEBrick.run app

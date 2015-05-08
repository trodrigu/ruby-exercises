require_relative 'lib/eliza_questions'
require 'rack/lobster'
require 'rack'
# app = Proc.new do |env|
#   req = Rack::Request.new env
#   puts Response.get_answer req.params['user_input']
#   ['200', {'Content-Type' => 'text/html'}, ['<form><input name=\'user_input\'><button type=\'submit\'>Click This</button></form>']  ]
# end

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
#
formatted_response = ''

LambdaEliza = lambda { |env|
req = Rack::Request.new env
input = req.params['user_input']
if input == 'clear'
    formatted_response = ''
    input = ''
end

response = Response.get_answer input unless input == nil || input == '' || input == 'clear'
formatted_response += "<br>#{input}<br><span>#{response}</span>"
content = [
            "<html><body><form action='/eliza/POST'>",
            "<title>Eliza doesn't know</title>",
            "<pre>What does Eliza think?</pre>",
            "<input type='text' name='user_input'>",
            "<button type='submit'>Click me</button>",
            "</form></body></html>"
            ]

content.insert(5, formatted_response)

            [200, {'CONTENT_TYPE' => "text/html"}, content]

}
app = Rack::Builder.app do
  use Rack::CommonLogger
  # run LambdaLobster
  map "/eliza" do
    run LambdaEliza
  end
end

Rack::Handler::WEBrick.run app

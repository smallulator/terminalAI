require 'net/http'
require 'json'

key = ENV['OPENAI_API_KEY']

unless key
  puts "You don't have OPEN_AI_KEY set"
  puts "Set is with `export OPENAI_API_KEY=xxxxxxxxxxx`"
  exit
end

puts 'Enter prompt:'
user_prompt = gets.chomp

url = URI('https://api.openai.com/v1/chat/completions')

request = Net::HTTP::Post.new(url)
request['Content-Type'] = 'application/json'
request['Authorization'] = "Bearer #{key}"

request.body = JSON.dump({
                           "model": 'gpt-3.5-turbo',
                           "messages": [{ "role": 'user', "content": user_prompt }],
                           "temperature": 0.7
                         })

response = Net::HTTP.start(url.hostname, url.port, use_ssl: true) do |http|
  http.request(request)
end

if response.code == '200'
  body = JSON.parse(response.body)
  answer = body['choices'][0]['message']['content']
else
  answer = "Could not get a proper response: code: #{}"
end
puts answer

require 'net/http'
require 'uri'
require 'json'
require 'pry'

puts 'Enter prompt:'
user_prompt = gets.chomp

url = URI('https://api.openai.com/v1/chat/completions')

request = Net::HTTP::Post.new(url)
request['Content-Type'] = 'application/json'
request['Authorization'] = "Bearer #{API_KEY}"

request.body = JSON.dump({
                           "model": 'gpt-3.5-turbo',
                           "messages": [{ "role": 'user', "content": user_prompt }],
                           "temperature": 0.7
                         })

response = Net::HTTP.start(url.hostname, url.port, use_ssl: true) do |http|
  http.request(request)
end

body = JSON.parse(response.body)
content = body['choices'][0]['message']['content']
puts content

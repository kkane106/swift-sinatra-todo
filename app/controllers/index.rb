get '/' do
  erb :index
end

get '/sushi.json'  do
	content_type :json
	return {:sushi => ["Refresh", "Maguro", "Hamachi", "Uni", "Saba", "Ebi", "Sake", "Tai"]}.to_json
end

get '/nothing_to_see' do
  "Nothing to see here. Move along."
end

post '/login' do
  values = JSON.parse(request.env["rack.input"].read)
  if values["todos"]
    "#{values["todos"]}"
  else
    "{\"success\":0}"
  end
end
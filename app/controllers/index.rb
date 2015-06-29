get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/sushi.json'  do
	content_type :json
	return {:sushi => ["Maguro", "Hamachi", "Uni", "Saba", "Ebi", "Sake", "Tai"]}.to_json
end
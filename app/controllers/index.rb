get '/' do
  erb :index
end

get '/sushi.json'  do
	content_type :json
	return {:sushi => ["Banana", "Maguro", "Hamachi", "Uni", "Saba", "Ebi", "Sake", "Tai"]}.to_json
end
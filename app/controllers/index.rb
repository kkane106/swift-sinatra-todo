get '/' do
  erb :index
end

get '/todos.json' do
	@todos = Todo.all
	content_type :json
	return {:todos => @todos}.to_json
end

get '/nothing_to_see' do
  "Nothing to see here. Move along."
end


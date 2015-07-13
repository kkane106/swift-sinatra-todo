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

post '/create_todo' do
  values = JSON.parse(request.env["rack.input"].read)
  if values["todos"]
  	@todo = Todo.new(:text => values["todos"])
    @todo.save
      return {:todo => [@todo]}.to_json
  else
    return "error".to_json
  end
end


post "/delete_todo" do
  values = JSON.parse(request.env["rack.input"].read)
  if values["todos"]
    Todo.find_by_id(values["todos"]).destroy
    return "success".to_json
  else
    return "error".to_json
  end
end

get "/todos" do
  @todos = Todo.all
  erb :todos
end

get "/new" do
  erb :new
end

post "/new" do
  @todo = Todo.new(params[:todo])
  if @todo.save
    redirect "todo/#{@todo.id}"
  else
    erb :new
  end
end

get "/todo/:id" do
  @todo = Todo.find_by_id(params[:id])
  erb :todo
end
get '/' do
  erb :index
end

get '/sushi.json'  do
	content_type :json
	return {:sushi => ["Again", "Refresh", "Maguro", "Hamachi", "Uni", "Saba", "Ebi", "Sake", "Tai"]}.to_json
end

get '/nothing_to_see' do
  "Nothing to see here. Move along."
end

post '/login' do
  values = JSON.parse(request.env["rack.input"].read)
  if values["todos"]
    # "#{values["todos"]}"
    let my_hash = {:banana => "test"}
    JSON.generate(my_hash)
  else
    "{\"success\":0}"
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
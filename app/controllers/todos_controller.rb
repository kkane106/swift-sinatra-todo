get "/todos" do
  @todos = Todo.all
  erb :todos
end

get "/todos/new" do
  erb :new
end

post "/todos" do
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
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

post "/todo/:id/" do |id|
  @todo = Todo.find(id).update!(params[:todo])
  p "LOOK HERE #{@todo}, #{params[:todo]}"
  redirect "todos"
end

delete "/todo/:id" do |id|
  Todo.find(id).destroy
  redirect "todos"
end
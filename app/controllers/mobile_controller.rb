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
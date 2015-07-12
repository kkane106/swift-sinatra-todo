require 'json'
class Todo < ActiveRecord::Base
	belongs_to :todos

	def convert_json_to_todo(json)
		json.parse
	end
end
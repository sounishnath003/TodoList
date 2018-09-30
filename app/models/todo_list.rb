class TodoList < ApplicationRecord
    has_many :todo_items
    validates :title, presence: true, length: { minimum: 8 }
    validates :description, presence: true 
end

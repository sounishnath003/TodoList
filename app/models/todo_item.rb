class TodoItem < ApplicationRecord
  belongs_to :todo_list
    # Below Code Cecks The To-Do Item if completed?"yes":"not "
  def completed?
      !completed_at.blank? # This Means The Completed_at field Will not Blank, its Contains Time.now(:val)
  end
end

class AddTaskReferenceToTask < ActiveRecord::Migration[5.2]
  def change
     add_reference :tasks, :task_list, foreign_key: true
  end
end

class AddQuizTypeToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :quiz_type, :integer
  end
end

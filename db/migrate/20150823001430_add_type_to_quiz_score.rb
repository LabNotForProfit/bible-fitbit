class AddTypeToQuizScore < ActiveRecord::Migration
  def change
  	add_column :quiz_scores, :quiz_type, :string
  end
end

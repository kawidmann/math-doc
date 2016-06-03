class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|

    	t.integer :user_id

    	t.string :date

    	t.string :problem_type
    	t.integer :total,  default: 0
    	t.integer :correct,  default: 0

      	t.timestamps null: false
    end
  end
end

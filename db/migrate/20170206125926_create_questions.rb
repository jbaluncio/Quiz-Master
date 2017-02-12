class CreateQuestions < ActiveRecord::Migration[5.0]
  def up
    create_table :questions do |t|
      t.text :content
      t.text :answer
      t.integer :user_id

      t.timestamps
    end
  end

  def down
  	drop_table :questions
  end
end

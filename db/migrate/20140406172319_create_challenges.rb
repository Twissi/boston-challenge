class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.timestamp :date
      t.string :title
      t.string :text
      t.integer :comments
      t.boolean :enabled
      t.string :answerPic
      t.string :answerText

      t.timestamps
    end
  end
end

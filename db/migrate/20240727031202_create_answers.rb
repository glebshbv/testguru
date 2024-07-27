class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.boolean :correct, default: true

      t.timestamps
    end
  end
end

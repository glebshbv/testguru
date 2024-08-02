class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.integer :result, default: 0, null: false
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end

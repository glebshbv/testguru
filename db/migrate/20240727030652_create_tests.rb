class CreateTests < ActiveRecord::Migration[7.1]
  def change
    create_table :tests do |t|
      t.string :title, default: "Rails Default Test"
      t.integer :level, default: 1

      t.timestamps
    end
  end
end

class InitialMigration < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false

      t.timestamps
    end

    create_table :categories do |t|
      t.string :title, null: false

      t.timestamps
    end

    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default: 1
      t.references :category, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    create_table :questions do |t|
      t.text :body, null: false
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end

    create_table :answers do |t|
      t.text :body, null: false
      t.boolean :correct, default: false, null: false
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end

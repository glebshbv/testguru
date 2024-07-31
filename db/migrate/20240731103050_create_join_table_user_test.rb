class CreateJoinTableUserTest < ActiveRecord::Migration[7.1]
  def change
    create_join_table :users, :tests, table_name: :attendance do |t|
      t.index :user_id
      t.index :test_id
    end
  end

end

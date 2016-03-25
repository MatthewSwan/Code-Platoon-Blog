class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
    end

    add_column :articles, :user_id, :integer
  end
end

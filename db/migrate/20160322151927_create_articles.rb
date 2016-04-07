class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text #probably make a more descriptive name
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end

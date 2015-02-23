class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.references :category
      t.references :user

      t.timestamps
    end
  end
end

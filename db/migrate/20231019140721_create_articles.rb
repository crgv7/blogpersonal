class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :tittle
      t.integer :status

      t.timestamps
    end
  end
end

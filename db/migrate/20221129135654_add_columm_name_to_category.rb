class AddColummNameToCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :name, :string
  end
end

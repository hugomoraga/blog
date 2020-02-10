class AddTitleToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :title, :string
    add_column :entries, :content, :string
    add_column :entries, :status, :string
  end
end

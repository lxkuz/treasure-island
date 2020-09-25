class AddFullPathToPages < ActiveRecord::Migration[6.0]
  def change
    add_column :pages, :full_path, :text
  end
end

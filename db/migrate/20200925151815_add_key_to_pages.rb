# Add key column for storing site map structure details
#
class AddKeyToPages < ActiveRecord::Migration[6.0]
  def change
    add_column :pages, :key, :text
  end
end

class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.references :parent, foreign_key: { to_table: :pages }, index: true
      t.string :path
      t.string :name
      t.timestamps
    end
  end
end

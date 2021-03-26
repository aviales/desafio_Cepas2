class CreateOenologists < ActiveRecord::Migration[5.1]
  def change
    create_table :oenologists do |t|
      t.string :name
      t.integer :age
      t.string :nationality

      t.timestamps
    end
  end
end

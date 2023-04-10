class CreateOpcvalues < ActiveRecord::Migration[7.0]
  def change
    create_table :opcvalues do |t|
      t.string :place
      t.float :value

      t.timestamps
    end
  end
end

class CreateSmstexts < ActiveRecord::Migration
  def change
    create_table :smstexts do |t|
      t.integer :recipient
      t.text :smsmessage

      t.timestamps
    end
  end
end

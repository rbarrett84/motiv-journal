class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.text :response
      t.belongs_to :user
      t.belongs_to :prompt

      t.timestamps
    end
  end
end

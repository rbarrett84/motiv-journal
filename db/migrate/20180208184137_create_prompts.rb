class CreatePrompts < ActiveRecord::Migration[5.1]
  def change
    create_table :prompts do |t|
      t.string :prompt_content

      t.timestamps
    end
  end
end

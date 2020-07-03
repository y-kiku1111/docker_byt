class CreateCatchCopies < ActiveRecord::Migration[5.2]
  def change
    create_table :catch_copies do |t|
      t.text :title,           null: false
      t.text :image,           null: false
      t.text :job_category,    null: false
      t.string :target,        null: false
      t.text :pay,          null: false
      t.text :commuting,    null: false
      t.text :shift,           null: false
      t.timestamps
    end
  end
end


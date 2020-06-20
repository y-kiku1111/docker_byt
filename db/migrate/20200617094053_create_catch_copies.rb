class CreateCatchCopies < ActiveRecord::Migration[5.2]
  def change
    create_table :catch_copies do |t|
      t.text :title
      t.string :target
      t.text :job_category
      t.text :image
      t.timestamps
    end
  end
end


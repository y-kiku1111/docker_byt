class AddUserToCatchCopies < ActiveRecord::Migration[5.2]
  def change
    add_reference :catch_copies, :user, foreign_key: true
  end
end

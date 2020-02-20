class CreateJoinTablePinUser < ActiveRecord::Migration[5.1]
  def change
    create_join_table :pins, :users do |t|
      # t.index [:pin_id, :user_id]
      # t.index [:user_id, :pin_id]
    end
  end
end

class ChangeColumnToAllowNull < ActiveRecord::Migration[6.0]
  def change
      def up
    change_column_null :address, :building_name, null: true   #「up」でnull: trueに変更しますよ、という意味
  end

  def down
    change_column_null :address, :building_name, null: false  #「down」でnull: false制約つきのものから⬆️⬆️⬆️
  end
  end
end

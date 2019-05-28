class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :title
      t.string :start
      t.string :finish

      t.timestamps
    end
  end
end

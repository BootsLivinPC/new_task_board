class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :tasks, through: :lists

  def self.all_list(board_id, list_id)
    Board.find_by_sql(["
      SELECT *
      FROM boards AS b
      WHERE b.id = ? AND b.list_id = ?
      , board_id, list_id
      ORDER BY priority DESC;"])
  end
end

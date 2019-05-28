class List < ApplicationRecord
  belongs_to :board
  has_many :tasks, dependent: :destroy

  def self.all_lists(board_id, list_id)
    Board.find_by_sql(["
      SELECT *
      FROM boards AS b
      WHERE b.id = #{board_id} AND b.list_id = #{list_id}
      ORDER BY priority DESC;"])
  end
end

class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :tasks, through: :lists

  def self.all_boards
    Board.find_by_sql(
      "SELECT *
      FROM boards AS b
      "
    )
  end

  def self.single_board(board_id)
    Board.find_by_sql(["
      SELECT *
      FROM boards AS b
      WHERE b.id = ?
      ", board_id]).first
  end

   def self.create_board(p)
    Board.find_by_sql(["
      INSERT INTO boards (title, created_at, updated_at)
      VALUES (:title, :created_at, :updated_at);
      ", {
        title: p[:title],
        created_at: DateTime.now,
        updated_at: DateTime.now
      }])
    end

    def self.update_board(board_id, p)
      Board.find_by_sql(["
        UPDATE boards AS b
        SET title = ?, start_date = ?, finish_date = ?, updated_at = ?
        WHERE b.id = ?
        ;", p[:title], p[:start_date], p[:finish_date], DateTime.now, board_id])
    end

      def self.delete_board(board_id)
        Board.find_by_sql(["
          DELETE FROM boards AS b
          WHERE b.id = ?;", board_id])
      end
end

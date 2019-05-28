class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :destroy, :update]

  def index
    @boards = Board.all_boards
  end

  def show
  end

  def new
    @board = Board.new
  end

  def edit
  end

  def create
    @board = Board.create_board(board_params)

      redirect_to boards_path
  end

  def update
    Board.update_board(@board.id, board_params)
      redirect_to boards_path
    end

  def destroy
    Board.delete_board(@board.id)
    redirect_to boards_path
  end

  private

  def set_board
    @board = Board.single_board(params[:id])
  end

  def board_params
    params.require(:board).permit(:title)
  end
end


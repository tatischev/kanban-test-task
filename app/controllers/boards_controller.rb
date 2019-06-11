class BoardsController < ApplicationController
	def index
	  @boards = Board.all
	  	render json: Resources.new(@boards)
    end
	end

	def new
		@board = Board.new
	end

	def show
	  	render json: @board
	end

	def create
		@board = Board.new(board_params)
		if @board.save
			render json: show, status: :created, location: @board
		else
		  render json: @board.errors, status: :unprocessable_entity
		end
	end

	def update
	  if @board.update(board_params)
	    render :show, status: :ok, location: @board
		else
		  render json: @board.errors, status: :unprocessable_entity
		end
	end

	def get_board
		@board = Board.find(board_id)
	end
end

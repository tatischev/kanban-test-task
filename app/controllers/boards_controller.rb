class BoardsController < ApplicationController
	def index
	  @boards = Board.all
	  respond_to do |format|
            format.json { render json: Resources.new(@boards) }
          end
	end

	def new
		@board = Board.new
	end

	def show
	  respond_to do |format|
	    format.json {render json: @board}
	  end		
	end

	def create
		@board = Board.new(board_params)
		respond_to do |format|
		  if @board.save
		    format.json { render :show, status: :created, location: @board }
		  else
		    format.json { render json: @board.errors, status: :unprocessable_entity }
		  end
		end
	end

	def update
		respond_to do |format|
		  if @board.update(board_params)
		    format.json { render :show, status: :ok, location: @board }
		  end
		end
	end

	def get_board
		@board = Board.find(board_id)
	end	
end

class ListsController < ApplicationController
	def index
	  @lists = List.all
		render json: Resources.new(@lists)
	end

	def new
	  board = Board.find(board_params[:id])
	  list = List.new(board: board)
	end

	def create
	  @list = List.new(list_params)
    if @list.save
      render :show, status: :created, location: @list }
	  else
	  	render json: @list.errors, status: :unprocessable_entity
	  end
	end

	def update
		if @list.update(list_params)
	  	render :show, status: :ok, location: @list
	  else
	  	render json: @list.errors, status: :unprocessable_entity
	  end
	end

	def destroy
	  @list.destroy
	  head :no_content
	end

	def get_list
	  @list = List.find(params[:id])
	end

	def list_params
	  params.require(:list).permit(:id, :board_id)
	end
end

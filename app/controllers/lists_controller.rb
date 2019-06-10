class ListsController < ApplicationController
	def index
	  @lists = List.all
	  respond_to do |format|
            format.json { render json: Resources.new(@lists) }
          end
	end

	def new
	  board = Board.find(board_params[:id])
	  list = List.new(board: board)
	end

	def create
	  @list = List.new(list_params)
	  respond_to do |format|
	    if @list.save
	      format.json { render :show, status: :created, location: @list }
	    else
	      format.json { render json: @list.errors, status: :unprocessable_entity }
	    end
	  end
	end

	def update
	  respond_to do |format|
	    if @list.update(list_params)
	      format.json { render :show, status: :ok, location: @list }
	    else
	      format.json { render json: @list.errors, status: :unprocessable_entity }
	    end
	  end
	end

	def destroy
	  @list.destroy
	  respond_to do |format|
	    format.json { head :no_content }
	  end
	end

	def get_list
	  @list = List.find(params[:id])
	end

	def list_params
	  params.require(:list).permit(:id, :board_id)
	end
end


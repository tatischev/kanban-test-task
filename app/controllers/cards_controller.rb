class CardsController < ApplicationController
	def index
	  @cards = Card.all
  	render json: Resources.new(@cards)
	end

	def new
	  list = List.find(list_params[:id])
	  @card = Card.new(list: list)
	end

	def create
	  @card = Card.new(card_params)
		if @card.save
	  	render :show, status: :created, location: @card
	  else
	  	render json: @card.errors, status: :unprocessable_entity
	  end
	end

	def update
	  if @card.update(card_params)
	  	render :show, status: :ok, location: @card
		else
	  	render json: @card.errors, status: :unprocessable_entity
	  end
	end

	def destroy
	  @card.destroy
	  head :no_content
	end

	def get_card
	  @card = Card.find(params[:id])
	end

	def card_params
	  params.require(:card).permit(:id, :title, :list_id)
	end
end

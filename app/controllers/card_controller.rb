class CardController < ApplicationController
  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
    @comment = Card.new_comment
  end

  def new
    @card = Card.new
    @column_id = params[:id]
  end

  def create
		@card = Card.new(card_params)
		if @card.save
      column_id = params[:card][:column_id]
      user_id = Card.get_user_id(column_id)

			redirect_to user_path(id: user_id)
		else
			render 'new'
		end
	end

  def destroy
    Card.find(params[:id]).delete
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    @card.update(card_params)

    column_id = params[:card][:column_id]
    user_id = Card.get_user_id(column_id)

    redirect_to user_path(id: user_id)
  end

  def move
    count = params[:count].to_i
    right_left = params[:right_left].to_i
    column_id = Card.get_id_to_move_card(count, right_left)
    @card = Card.find(params[:id])

    @card.update_attributes(column_id: column_id)

    redirect_to columns_path
  end

  private
    def card_params
      params.require(:card).permit(
        :name,
        :column_id,
        :deadline
      )
    end
end

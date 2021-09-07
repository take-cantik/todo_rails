class Api::CardController < ApiController
  def index
    @cards = Card.all_find_user(params[:id])
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
		card = Card.new(card_params)
		if card.save
      column_id = params[:card][:column_id]
      user_id = Card.get_user_id(column_id)

			redirect_to user_path(id: user_id)
		else
			render 'new'
		end
	end

  def destroy
    card = Card.find(params[:id])
    card_user_id = Card.get_user_id(card.column_id)
    user_id = params[:user_id].to_i

    if card_user_id == user_id then
      card.delete
    else
      render status: 401
    end

		redirect_to user_path(id: user_id)
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    card = Card.find(params[:id])
    card.update(card_params)

    column_id = params[:card][:column_id]
    user_id = Card.get_user_id(column_id)

    redirect_to user_path(id: user_id)
  end

  def move
    user_id = params[:user_id].to_i
    count = params[:count].to_i
    right_left = params[:right_left].to_i
    column_id = Card.get_column_id_to_move_card(user_id, count, right_left)
    card = Card.find(params[:id])

    card.update_attributes(column_id: column_id)

    redirect_to user_path(id: user_id)
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

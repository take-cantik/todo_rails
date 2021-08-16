class CardController < ApplicationController
  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def create
		@card = Card.new(card_params)
		if @card.save
			redirect_to columns_path
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
    redirect_to columns_path
  end

  def move_right
    @columns = Column.order(:order)
    @card = Card.find(params[:id])
    count = params[:count].to_i
    column_id = nil

    @columns.each_with_index do |column, index|
      if count + 1 == index then
        column_id = column.id
      end
    end

    if column_id != nil then
      @card.update_attributes(column_id: column_id)
    end

    redirect_to columns_path
  end

  def move_left
    redirect_to columns_path
  end

  private
    def card_params
      params.require(:card).permit(
        :name,
        :discription,
        :column_id,
        :deadline
      )
    end
end

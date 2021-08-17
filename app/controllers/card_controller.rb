class CardController < ApplicationController
  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
    @comment = Comment.new
  end

  def new
    @card = Card.new
    @column_id = params[:id]
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

  def move
    @columns = Column.order(:order)
    @card = Card.find(params[:id])
    count = params[:count].to_i
    right_left = params[:right_left].to_i
    column_id = nil

    @columns.each_with_index do |column, index|
      if right_left == 0 then
        if count + 1 == index then
          column_id = column.id
        end
      elsif right_left == 1 then
        if count - 1 == index then
          column_id = column.id
        end
      end
    end

    if column_id != nil then
      @card.update_attributes(column_id: column_id)
    end

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

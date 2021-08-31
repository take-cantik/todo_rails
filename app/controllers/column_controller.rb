class ColumnController < ApplicationController
  def index
		@columns = Column.order(:order)
		@count = Column.count
	end

	def new
		@column = Column.new
	end

	def create
		@column = Column.new(column_params)
		if @column.save
			redirect_to columns_path
		else
			render 'new'
		end
	end

	def destroy
		Column.find(params[:id]).delete
	end

	def edit
		@column = Column.find(params[:id])
	end

	def update
		@column = Column.find(params[:id])
		@column.update(column_params)
		redirect_to columns_path
	end

	def swap
		count = params[:count].to_i
		# right -> 1, left -> -1
		right_left = params[:right_left].to_i

		@original, @change = Column.get_swap_columns(count, right_left)

		original_order = @original.order
		change_order = @change.order

		@original.update_attributes(order: change_order)
		@change.update_attributes(order: original_order)

		redirect_to columns_path
	end

	private
		def column_params
			params.require(:column).permit(
				:name,
				:order
			)
		end
end

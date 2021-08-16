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
		columns = Column.order(:order)
		count = params[:count].to_i
		# right -> 0, left -> 1
		right_left = params[:right_left].to_i

		columns.each_with_index do |column, index|
			if count == index then
				original_column = column
			end

			if right_left == 0 then
				if count + 1 == index then
					change_column = column
				end
			else
				if count - 1 == index then
					change_column = column
				end
			end
		end

		original_order = change_column.order
		change_order = original_column.order

		original_column.update_attributes(order: original_order)
		change_column.update_attributes(order: change_order)

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

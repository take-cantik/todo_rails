class ColumnController < ApplicationController
  def index
		@columns = Column.order(:order)
		@count = Column.count
		logger.debug("なんの？")
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
		count = params[:count]
		count = count.to_i

		columns.each_with_index do |column, index|
			logger.debug("----------------------")
			logger.debug(count)
			logger.debug(index)
			if count == index then
				@left_column = column
				logger.debug("left_column:")
				logger.debug(@left_column)
				logger.debug(@left_column.order)
			elsif count + 1 == index then
				@right_column = column
				logger.debug("right_column:")
				logger.debug(@right_column)
				logger.debug(@right_column.order)
			end
		end

		@left_column.order, @right_column.order = @right_column.order, @left_column.order

		@left_column.update(column_params)
		@right_column.update(column_params)

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

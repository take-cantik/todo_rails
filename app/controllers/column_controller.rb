class ColumnController < ApplicationController
  def index
		@columns = Column.order(:order)
		@count = Column.count
	end

	def new
		@column = Column.new
		@user_id = params[:id]
	end

	def create
		column = Column.new(column_params)
		if column.save
			user_id = params[:column][:user_id]
			redirect_to user_path(id: user_id)
		else
			render 'new'
		end
	end

	def destroy
		user_id = params[:user_id].to_i
		column = Column.find(params[:id])

		if user_id == column.user_id then
			column.delete
		else
			render status: 401
		end

		redirect_to user_path(id: user_id)
	end

	def edit
		@column = Column.find(params[:id])
	end

	def update
		column = Column.find(params[:id])
		column.update(column_params)
		redirect_to user_path(column.user_id)
	end

	def swap
		user_id = params[:user_id].to_i
		count = params[:count].to_i
		right_left = params[:right_left].to_i

		original, change = Column.get_swap_columns(user_id, count, right_left)

		original_order = original.order
		change_order = change.order

		original.update_attributes(order: change_order)
		change.update_attributes(order: original_order)

		redirect_to user_path(id: user_id)
	end

	private
		def column_params
			params.require(:column).permit(
				:name,
				:order,
				:user_id
			)
		end
end

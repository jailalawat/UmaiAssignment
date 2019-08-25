class ListsController < ApplicationController
  before_action :find_list, only: [:edit, :destroy, :update]

  def index
  	@lists = List.paginate(page: params[:page])
  end

  def new
  	@list = List.new
  end

  def create
  	@list = List.new(list_params)
  	if @list.save
  		redirect_to root_path, notice: 'List was successfully created'
  	else
  		render :new
  	end
  end

  def update
  	if @list.update(list_params)
  		redirect_to root_path, notice: 'List was successfully updated'
  	else
  		render :new
  	end
  end

  def destroy
  	@list.destroy
  	redirect_to root_path, notice: 'List was successfully deleted'
  end

  private
  	def list_params
  		params.require(:list).permit(:name, list_items_attributes:[:name, :id, :_destroy])
  	end

  	def find_list
  		@list = List.find_by(id: params[:id])
  		return not_found if @list.nil?
  	end
end

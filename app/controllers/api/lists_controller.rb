class Api::ListsController < ApiController
  before_action :authenticated?

  def show
    list = List.find(params[:id])
  end

  def create
    user = User.find(params[:user_id])
    list = user.lists.new(list_params)
    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, \
             status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:user_id])
    list = user.lists.find(params[:id])
    list.destroy
    render json: { message: :"List #{params[:id]} has been deleted" }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'List not found' }, status: :not_found
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      render json: list
    else
      render json: { error: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :description, :permissions)
  end
end

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
    render json: { error: 'List not found' }, status: :not_found
  end

  def update
    list = List.find(params[:id])
    if { list.permissions == 0 && list.update(list_params) }
      render json: list
    elsif list.public == false
      render json: { error: :"This list is private and cannot be edited."}, status: 400
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :description, :permissions)
  end
end

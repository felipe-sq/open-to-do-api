class Api::UsersController < ApiController
  before_action :authenticated?

  def index
    UserSerializer.new(User.all).to_json
    render json: users, each_serializer: UserSerializer
  end

end

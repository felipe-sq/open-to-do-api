class Api::UsersController < ApiController
  before_action :authenticated?

  def index
    users = User.all
    UserSerializer.new(users).to_json
    render json: users, each_serializer: UserSerializer
  end

end

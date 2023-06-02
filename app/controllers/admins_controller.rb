class AdminsController < ApplicationController
  skip_before_action :authenticate_user, only: [:login, :create]

  def login
    @admin = Admin.find_by_email(params[:email])

    if @admin&.authenticate(params[:password])
      @token = jwt_encode({user_id: @admin.id})
    else
      render json: {error: true, msg: 'Email or password is wrong'}
    end
  end

  def index
    @admins = Admin.all
  end

  def create
    @admin = Admin.create!(admin_params)

  rescue StandardError => e
    render json: {error: true, msg: e.message}
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :name, :password)
  end
end

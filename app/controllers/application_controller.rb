class ApplicationController < ActionController::API
  include JwtToken

  before_action :authenticate_user

  private

  def authenticate_user
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    
    begin
      @decode = jwt_decode(header)
      @current_user = Admin.find_by_id(@decode[:user_id])
    rescue StandardError => e
      render json: {error: true, msg: e.message}
    end
  end
end

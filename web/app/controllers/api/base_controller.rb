class Api::BaseController < ActionController::Base
  before_action :authenticate_user!

  rescue_from StandardError, with: respond_with_error

  def respond_with_error(exe)
    logger.error(exe)
    render json: {
      message: exe.message,
      backtrace: exe.backtrace[0..5]
    }, status: :internal_server_error
  end

  def respond_with_success(res)
    render json: res, status: :success
  end
end

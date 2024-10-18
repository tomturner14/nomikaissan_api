class ApplicationController < ActionController::API
  def hello
    render json:{message: "Fuga World"}
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def authorize_admin!
    unless current_user.admin?
      redirect_to root_path, notice: "Para acceder a esta sección debes ser administrador" 
    end
  end


end


class RegistrationsController < Devise::RegistrationsController

  private
  
  def user_params
    params.require(:user).permit(:avatar)
  end

end

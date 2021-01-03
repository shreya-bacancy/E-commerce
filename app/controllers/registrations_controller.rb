# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  def destroy
    resource.soft_delete
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed
    yield resource if block_given?
    respond_with_navigational(resource) { redirect_to after_sign_out_path_for(resource_name) }
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email,
                                 :contact_no, :dob, :password, :password_confirmation)
  end
end

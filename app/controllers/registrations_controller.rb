class RegistrationsController< Devise::RegistrationsController

	private
	
	def sign_up_params
		params.require(:user).permit(:name,:email,
			:contact_no,:dob,:password,:password_confirmation)
	end

end

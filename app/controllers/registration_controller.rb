class RegistrationController < Devise::RegistrationsController

  protected
    def after_update_path_for(resource)
      user_path(:id)
    end
end
class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(employee)
    employees_create_or_join_path
  end
end

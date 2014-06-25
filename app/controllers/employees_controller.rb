class EmployeesController < ApplicationController

  def join
    #render text: params.inspect
    @employee = current_employee
    @employee.update_attributes(:restaurant_id => params[:employee][:restaurant_id])
    redirect_to root_path
  end

end

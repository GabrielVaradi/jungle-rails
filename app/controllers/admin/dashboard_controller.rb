class Admin::DashboardController < Admin::BaseController
  def show
  end
      http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]

end

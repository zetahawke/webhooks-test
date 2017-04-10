class Api::PackagesController < ApplicationController
  protect_from_forgery with: :null_session

  def from_webhooks
    binding.pry
    @package = Package.find_by(package_id: params[:info][:id])
    if @package.blank?
      @package = Package.create(package_id: params[:info][:id], data: params[:info])
    else
      @package = Package.update(data: params[:info])
    end
    render json: { package: @package }, status: :ok
  end
end

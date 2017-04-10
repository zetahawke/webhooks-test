class Api::PackagesController < ApplicationController
  protect_from_forgery with: :null_session

  def from_webhooks
    @package = Package.find_by(package_id: params[:body][:id])
    if @package.blank?
      @package = Package.create(package_id: params[:body][:id], data: params[:body])
    else
      @package = Package.update(data: params[:body])
    end
    render json: { package: @package }, status: :ok
  end
end

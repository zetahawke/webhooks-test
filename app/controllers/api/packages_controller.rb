class Api::PackagesController < ApplicationController
  protect_from_forgery with: :null_session

  def from_webhooks
    data = JSON.parse(params[:body])
    @package = Package.find_by(package_id: data['id'])
    if @package.blank?
      @package = Package.create(package_id: data['id'], data: data)
    else
      @package = Package.update(data: data)
    end
    render json: { package: @package }, status: :ok
  end
end

class PackagesController < ApplicationController
  def index
    @packages = Package.all
  end

  def from_webhook
    Package.create(data: params[:info])
  end
end

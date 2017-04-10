class PackagesController < ActionController::API
  def index
    @packages = Package.all
  end

  def from_webhooks
    binding.pry
    Package.create(data: params[:info]) if Package.find_by(reference: params[:info][:reference])
  end
end

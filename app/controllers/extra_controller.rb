class ExtraController < ApplicationController
  def new
  end

  def index
    @products = Product.all.with_attached_image.order(:name)
  end
end

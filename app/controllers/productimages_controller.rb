class ProductimagesController < ApplicationController
  before_action :set_product_image, only: [:edit, :update]

  
  def index
    @productimages = Productimage.all
  end

  def new
    @product = Product.find(params[:product_id])
    @productimage = Productimage.new
  end

  def show
    @productimage = Productimage.find(params[:id])
  end

  def edit
    @product = Product.find(params[:product_id])
    @productimage = Productimage.find(params[:id])
  end
  
  def create
    @product = Product.find(params[:product_id])
    @productimage = Productimage.new(productimage_params)
    @productimage.product_id = params[:product_id]

  
    if @productimage.save
      redirect_to product_productimage_url(@product, @productimage)
    else
      render :new
    end
  end

  def update
    @productimage = Productimage.find(params[:id])
    if @productimage.update(productimage_params)
      redirect_to product_productimage_url
    else
    render :edit ,status: :unprocessable_entity
    end
  end
  
  
  def destroy
    @productimage = Productimage.find(params[:id])
    @productimage.destroy
    redirect_to product_productimages_path, notice: 'Productimage was successfully destroyed.'
  end
  

  private

  def set_product_image
    @productimage = Productimage.find(params[:id])
  end

    def productimage_params
      params.require(:productimage).permit(:image, :product_id)
    end
end

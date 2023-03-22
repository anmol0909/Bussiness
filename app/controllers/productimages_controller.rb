class ProductimagesController < ApplicationController
  
  def index
    @productimages = Productimage.all
  end

  def new
    @productimage = Productimage.new
  end

  def show
    @productimage = Productimage.find(params[:id])
  end

  def edit
    @productimage = Productimage.find(params[:id])
  end
  
  def create
    @productimage = Productimage.new(productimage_params)
  
    if @productimage.save
      redirect_to @productimage, notice: 'Productimage was successfully created.'
    else
      render :new
    end
  end
  
  
  def destroy
    @productimage = Productimage.find(params[:id])
    @productimage.destroy
    redirect_to productimages_url, notice: 'Productimage was successfully destroyed.'
  end
  

  private

    def productimage_params
      params.require(:productimage).permit(:image, :product_id)
    end

end

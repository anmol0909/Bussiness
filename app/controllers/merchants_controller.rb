class MerchantsController < ApplicationController
    def new
      @Merchant = Merchant.new
    end
    
    def create
      @Merchant = Merchant.new(merchant_params)
      if @Merchant.save
        redirect_to root_path, notice: 'Merchant created successfully!'
      else
        render :new
      end
    end
  
    
    private
    
    def merchant_params
      params.require(:Merchant).permit(:email, :password, :password_confirmation)
    end
  end
  
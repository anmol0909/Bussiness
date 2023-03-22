class IdproofsController < ApplicationController

  def index
    @idproofs = Idproof.all
  end

  def new
    @idproof = Idproof.new
  end

  def show
    @idproof = Idproof.find(params[:id])
end

def edit
  @idproof = Idproof.find(params[:id])
end

def create
  @idproof = Idproof.new(idproof_params)

  if @idproof.save
    redirect_to @idproof, notice: 'Idproof was successfully created.'
  else
    render :new
  end
end


def destroy
  @idproof = Idproof.find(params[:id])
  @idproof.destroy
  redirect_to idproofs_url, notice: 'Idproof was successfully destroyed.'
end

def update
  @idproof = Idproof.find(params[:id])

  if @idproof.update(idproof_params)
    redirect_to @idproof, notice: 'Idproof was successfully updated.'
  else
    render :edit
  end
end

  private

    def idproof_params
      params.require(:idproof).permit(:document, :merchant_id, :status)
    end

end

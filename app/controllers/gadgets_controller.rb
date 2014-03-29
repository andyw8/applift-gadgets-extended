class GadgetsController < ApplicationController
  def index
    @gadgets = Gadget.all
  end

  def new
    @gadget = Gadget.new
  end

  def create
    @gadget = Gadget.new(gadget_params)
    if @gadget.save
      flash[:notice] = "New gadget added"
      redirect_to gadgets_path
    else
      flash[:error] = "There was a problem"
      render 'new'
    end
  end

  private

  def gadget_params
    params.require(:gadget).permit(:name)
  end
end

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

  def edit
    @gadget = Gadget.find(params[:id])
  end

  def update
    @gadget = Gadget.find(params[:id]) # TODO refactor to avoid duplication
    @gadget.update(gadget_params) # TODO handle failed update
    flash[:notice] = "Gadget updated"
    redirect_to gadgets_path
  end

  private

  def gadget_params
    params.require(:gadget).permit(:name)
  end
end

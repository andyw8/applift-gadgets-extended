class GadgetsController < ApplicationController
  before_filter :find_model, only: [:edit, :update, :destroy]

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
  end

  def update
    @gadget.update(gadget_params) # TODO handle failed update
    flash[:notice] = "Gadget updated"
    redirect_to gadgets_path
  end

  def destroy
    @gadget.destroy
    flash[:notice] = "Gadget deleted"
    redirect_to gadgets_path
  end

  private

  def gadget_params
    params.require(:gadget).permit(:name)
  end

  def find_model
    @gadget = Gadget.find(params[:id])
  end
end

class GadgetsController < ApplicationController
  def index
    @gadgets = Gadget.all
  end

  def new
    @gadget = Gadget.new
  end

  def create
    @gadget = Gadget.new(gadget_params)
    @gadget.save # TODO handle save failures
    flash[:notice] = "New gadget added"
    redirect_to gadgets_path
  end

  private

  def gadget_params
    params.require(:gadget).permit(:name)
  end
end

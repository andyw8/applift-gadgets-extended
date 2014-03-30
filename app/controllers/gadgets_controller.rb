class GadgetsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_model, only: [:edit, :update, :destroy]

  def index
    if params[:query]
      @gadgets = scoped_gadgets.match_name(params[:query])
    else
      @gadgets = scoped_gadgets
    end
  end

  def new
    @gadget = scoped_gadgets.new
  end

  def create
    @gadget = scoped_gadgets.new(gadget_params)
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
    params.require(:gadget).permit(:name, :image)
  end

  def find_model
    @gadget = scoped_gadgets.find(params[:id])
  end

  def scoped_gadgets
    current_user.gadgets
  end
end

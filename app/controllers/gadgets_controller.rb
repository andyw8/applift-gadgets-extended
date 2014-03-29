class GadgetsController < ApplicationController
  def index
    @gadgets = Gadget.all
  end
end

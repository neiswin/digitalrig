class PagesController < ApplicationController
  def index
    @opcvalues = Opcvalue.order(created_at: :desc) 
  end
end

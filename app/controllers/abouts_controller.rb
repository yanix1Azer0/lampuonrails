class AboutsController < ApplicationController
	
  before_action :authenticate_user!
  def index
  	@page_title= 'About' 
  end

end

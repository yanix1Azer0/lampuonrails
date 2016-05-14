class KendalixesController < ApplicationController
	layout 'kendali'
  def index
  	@kendalixe = Kendalixe.find(3)
  end

  def create
  	@kendalixe = Kendalixe.find(3)
    @kendalixe.update(kendalixe_params)

		
		@aktuator = Aktuator.find(params.fetch(:aktuatorid))
    	@aktuator.update(aktuator_params)


    flash[:notice] = params.fetch(:notifaktuator)
    redirect_to homes_path
  end


	
  private
   def kendalixe_params
    params.permit(:nilai)
   end

   def aktuator_params
    params.permit(:status)
   end

 
   
end

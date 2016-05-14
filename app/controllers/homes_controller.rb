class HomesController < ApplicationController
	
  before_action :authenticate_user!
  def index
  	@page_title='Selamat Datang'
  	@aktuators = Aktuator.all
  	@sensors = Sensor.all
  	@sensor1 = Sensor.find(4)
  	@sensor2 = Sensor.find(5)
  	@rekamsensor1 = @sensor1.rekamsensors
  	@rekamsensor2 = @sensor2.rekamsensors
  	@rekamsensor11 = @rekamsensor1.order("created_at").last
  	@rekamsensor12 = @rekamsensor2.order("created_at").last
  end
end

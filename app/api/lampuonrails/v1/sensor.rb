module Lampuonrails
  class V1::Sensor < Grape::API

  	 use Rack::JSONP

  	 helpers do
      params :token do
        optional :token, type: String, default: nil,
        documentation: {
          type: 'String',
          desc: 'Authenticate token'
        }
      end

      params :attributes do
        optional :attributes, type: Hash, default: {},
        documentation: {
          type: 'Hash',
          desc: 'Params attributes of Sensor'
        }
      end
    end

    resource :sensors do

      desc 'REST GET with no parameters.' do
        detail <<-NOTE
            Make a query for measures.
            -----------------

            Returns an array of all measures.
          NOTE
      end

      get do
        api_response(::Sensor.all.to_json)
      end

      route_param :id do

        desc 'REST GET with id param.' do
          detail <<-NOTE
              Make a query for a measure with certain id.
              -----------------

              Returns the result of query for a measure.
            NOTE
        end

        params do
          use :token, type: String, desc: 'Authentication token'
          requires :id, type: Integer, desc: "Sensor ID"
        end
        get do
          begin
            authenticate!

            sensor = ::Sensor.find(params[:id])
            api_response(sensor.to_json)
          rescue ActiveRecord::RecordNotFound => e
            status 404 # Not found
          end
        end
      end

        desc 'REST Post with attributes params.' do
        detail <<-NOTE
            Creates a measure with the information passed through params.
            -----------------
          NOTE
      end 

      params do
        use :token
          requires :attributes, type: Hash, desc: 'Sensor object to create' do
          requires :nama, type: String, desc: 'Nama Sensor'
          requires :deskripsi, type: String, desc: 'Deskripsi Sensor'
          requires :jenis, type: String, desc: 'Jenis Sensor' 
        end
      end
      post do
        begin
          authenticate!
          safe_params = clean_params(params[:attributes])
                        .permit(:nama, :deskripsi, :jenis )

          if safe_params
            ::Sensor.create!(safe_params)
            status 200 # Saved OK
          end
        rescue ActiveRecord::RecordNotFound => e
          status 404 # Not found
        end
      end


       desc 'REST Put with attributes param.' do
        detail <<-NOTE
            Updates a measure with the information passed through params.
            -----------------
          NOTE
      end 
          
      params do
        use :token, type: String, desc: 'Authentication token'
        requires :id, type: Integer, desc: "Sensor ID"
        requires :attributes, type: Hash, desc: 'Sensor object to create' do
         requires :nama, type: String, desc: 'Nama Sensor'
          requires :deskripsi, type: String, desc: 'Deskripsi Sensor'
          requires :jenis, type: String, desc: 'Jenis Sensor' 
        end
      end
      put ':id' do
        begin
          authenticate!
          safe_params = clean_params(params[:attributes]).permit(:nama, :deskripsi, :jenis )

          if safe_params
            sensor = ::Sensor.find(params[:id])
            sensor.update_attributes(safe_params)
            status 200 # Saved OK
          end
        rescue ActiveRecord::RecordNotFound => e
          status 404 # Not found
        end
      end
    end
  end
end  
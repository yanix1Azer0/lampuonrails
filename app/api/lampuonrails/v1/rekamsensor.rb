module Lampuonrails
  class V1::Rekamsensor < Grape::API
    use Rack::JSONP

    helpers do
      params :token do
        optional :token, type: String, default: nil,
        documentation: {
          type: 'String',
          desc: 'Authenticate token'
        }
      end

      params :value do
        optional :value, type: Integer, default: nil,
        documentation: {
          type: 'Integer',
          desc: 'Value of rekamsensor'
        }
      end
    end

    resource :rekamsensors do
      desc 'REST GET with no parameters.' do
        detail <<-NOTE
            Make a query for rekamsensors.
            -----------------

            Returns an array of all rekamsensors.
          NOTE
      end
      get do
        api_response(::Rekamsensor.all.to_json)
      end

      route_param :id do
        desc 'REST GET with id param.' do
          detail <<-NOTE
              Make a query for a rekamsensor with certain id.
              -----------------

              Returns the result of query for a rekamsensor.
            NOTE
        end
        params do
          requires :token, type: String, desc: 'Authentication token'
          requires :id, type: Integer, desc: "Rekamsensor ID"
        end
        get do
          begin
            authenticate!

            rekamsensor = ::Rekamsensor.find(params[:id])
            api_response(rekamsensor.to_json)
          rescue ActiveRecord::RecordNotFound => e
            status 404 # Not found
          end
        end
      end

      desc 'REST Post with attributes params.' do
        detail <<-NOTE
            Creates a rekamsensor with the information passed through params.
            -----------------
          NOTE
      end
      params do
        requires :token
        requires :sensor_id, type: Integer, desc: 'ID of sensor rekamsensor'
        requires :nilai, type: Integer, desc: 'Value of rekamsensor'
      end
      post do
        begin
          authenticate!
          safe_params = clean_params(params)
                        .permit(:nilai, :sensor_id)

          if safe_params
            ::Rekamsensor.create!(safe_params)
            status 200 # Saved OK
          end
        rescue ActiveRecord::RecordNotFound => e
          status 404 # Not found
        end
      end

      desc 'REST Put with attributes param.' do
        detail <<-NOTE
            Updates a rekamsensor with the information passed through params.
            -----------------
          NOTE
      end
      params do
        requires :token
        requires :sensor_id, type: Integer, desc: 'ID of sensor rekamsensor'
        requires :nilai, type: Integer, desc: 'Value of rekamsensor'
      end
      put ':id' do
        begin
          authenticate!
          safe_params = clean_params(params)
                        .permit(:nilai, :sensor_id)

          if safe_params
            rekamsensor = ::Rekamsensor.find(params[:id])
            rekamsensor.update_attributes(safe_params) unless rekamsensor.blank?

            status 200 # Saved OK
          end
        rescue ActiveRecord::RecordNotFound => e
          status 404 # Not found
        end
      end
    end

  end
end

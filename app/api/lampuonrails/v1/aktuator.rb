module Lampuonrails
  class V1::Aktuator < Grape::API
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
          desc: 'Params attributes of aktuator'
        }
      end
    end

    resource :aktuators do

      desc 'REST GET with no parameters.' do
        detail <<-NOTE
            Make a query for measures.
            -----------------

            Returns an array of all measures.
          NOTE
      end

      get do
        api_response(::Aktuator.all.to_json)
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
          requires :id, type: Integer, desc: "Aktuator ID"
        end
        get do
          begin
            authenticate!

            aktuator = ::Aktuator.find(params[:id])
            api_response(aktuator.to_json)
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
          requires :attributes, type: Hash, desc: 'Aktuator object to create' do
          requires :nama, type: String, desc: 'Nama Aktuator'
          requires :deskripsi, type: String, desc: 'Deskripsi Aktuator'
          requires :jenis, type: String, desc: 'Jenis aktuator'
          requires :watt, type: Integer, desc: 'Watt aktuator'
        end
      end

      post do
        begin
          authenticate!
          safe_params = clean_params(params[:attributes])
                        .permit(:nama, :deskripsi, :jenis, :watt)

          if safe_params
            ::Aktuator.create!(safe_params)
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
        requires :id, type: Integer, desc: "Aktuator ID"
        requires :attributes, type: Hash, desc: 'Aktuator object to create' do
         requires :nama, type: String, desc: 'Nama Aktuator'
          requires :deskripsi, type: String, desc: 'Deskripsi Aktuator'
          requires :jenis, type: String, desc: 'Jenis aktuator'
          requires :watt, type: Integer, desc: 'Watt aktuator'
        end
      end
      put ':id' do
        begin
          authenticate!
          safe_params = clean_params(params[:attributes]).permit(:nama, :deskripsi, :jenis, :watt)

          if safe_params
            aktuator = ::Aktuator.find(params[:id])
            aktuator.update_attributes(safe_params)
            status 200 # Saved OK
          end
        rescue ActiveRecord::RecordNotFound => e
          status 404 # Not found
        end
      end
    end
  end
end  
class ApplicationController < ActionController::API

    include JsonWebToken

    before_action :auth_req

    private 

        def auth_req
            header = request.headers['Authorization']
            header = header.split(" ").last if header
            decoded = jwt_decode(header)
            if decoded == 1
                render json: { error: "Invalid Token" }, status: :unauthorized
            else
                @current_user = User.find(decoded[:user_id])
            end
        end

end

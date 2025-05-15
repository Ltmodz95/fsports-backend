module Api
  module V1
    class SessionsController < BaseController
      allow_unauthenticated_access only: %i[ create verify ]
      rate_limit to: 10, within: 3.minutes, only: :create, with: -> { render json: { error: "Too many attempts. Try again later." }, status: :too_many_requests }
      def create
        if user = User.authenticate_by(params.permit(:email_address, :password))
          start_new_session_for user
          render json: { data: { token: Current.session.token, user_role: user.role } }
        else
          render json: { error: "Invalid credentials" }, status: :unauthorized
        end
      end

      def verify
        session = Session.find_by(token: params[:token])
        if session

          render json: { data: { token: params[:token], user_role: session.user.role } }
        else
          render json: { error: "Invalid token" }, status: :unauthorized
        end
      end

      def destroy
        terminate_session
        head :no_content
      end
    end
  end
end 
module Api
  module V1
    class PasswordsController < BaseController
      allow_unauthenticated_access
      before_action :set_user_by_token, only: %i[ update ]

      def create
        if user = User.find_by(email_address: params[:email_address])
          PasswordsMailer.reset(user).deliver_later
        end

        render json: { message: "Password reset instructions sent (if user with that email address exists)." }
      end

      def update
        if @user.update(params.permit(:password, :password_confirmation))
          render json: { message: "Password has been reset." }
        else
          render json: { error: "Passwords did not match." }, status: :unprocessable_entity
        end
      end

      private
        def set_user_by_token
          @user = User.find_by_password_reset_token!(params[:token])
        rescue ActiveSupport::MessageVerifier::InvalidSignature
          render json: { error: "Password reset link is invalid or has expired." }, status: :unprocessable_entity
        end
    end
  end
end 
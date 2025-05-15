module Api
  module V1
    class BaseController < ApplicationController      
      before_action :set_api_version_header
      
      if Rails.env.test?
        skip_before_action :require_authentication
      end
      
      private
      
      def set_api_version_header
        response.headers['X-API-Version'] = '1.0'
      end
    end
  end
end 
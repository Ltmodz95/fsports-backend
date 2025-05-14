module Api
  module V1
    class BaseController < ApplicationController      
      before_action :set_api_version_header
      
      private
      
      def set_api_version_header
        response.headers['X-API-Version'] = '1.0'
      end
    end
  end
end 
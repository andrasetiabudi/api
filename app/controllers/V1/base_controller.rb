module V1
  class BaseController < ApplicationController

    # Write methods and filters that should be available to 
    # other endpoints on this endpoint version here
    before_filter :accept_json_only_requests

    def accept_json_only_requests
      return if params[:format] == 'json' || request.headers['Accept'] =~ /json/
      
      render :nothing => true, :status => 406
    end

  end 
end
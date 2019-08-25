require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

	def not_found
	  render :file => "#{Rails.root}/public/404.html",  :status => 404
	end
end

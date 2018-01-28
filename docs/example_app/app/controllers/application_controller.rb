class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper Bootstrap::ViewHelpers::Engine.helpers
end

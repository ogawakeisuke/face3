class WelcomeController < ApplicationController
  def index
  	@agent = request.headers['User-Agent']
  end
end

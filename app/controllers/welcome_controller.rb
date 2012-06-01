class WelcomeController < ApplicationController
  def index
  	feature = ["DoCoMo","UP.Browser","J-PHONE","Vodafone","SoftBank"]
  	@agent = request.headers['User-Agent']

    feature.each do |fe|
  		if @agent.index(fe)
  			@you_are = "feature!"
  		else
  			@you_are = "smart!"
  		end
  	end
  end
end

class WelcomeController < ApplicationController
  def index
  	feature = ["DoCoMo","UP.Browser","J-PHONE","Vodafone","SoftBank"]
  	@agent = request.headers['User-Agent']
  	#@testscript = "J-PHONE/5.0 (Macintosh; Intel Mac OS X 10_7_4) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.52 Safari/536.5 "

    feature.each do |fe|
    	check =@agent.include?(fe)
  		if check
  			@you_are = "feature!"
  			break
  		else
  			@you_are = "smart!"
  		end
  	end
  end
end

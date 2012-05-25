class SessionsController < ApplicationController
	def login
	  auth = request.env['omniauth.auth']
	  logger.debug("----------------")
	  logger.debug(auth.to_yaml)
	  user = User.find_by_nickname(auth['info']['nickname']) || User.create_account(auth)
	 
	  session[:user_id] = user.id
	  redirect_to root_url, :notice => 'log in'
	end
	 
	def logout
	  session[:user_id] = nil
	  redirect_to root_url, :notice => 'log out'
	end

end

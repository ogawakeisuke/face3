class User < ActiveRecord::Base
  attr_accessible :email, :image_url, :nickname

  	def self.create_account(auth)
	  user = User.new
	  user.nickname = auth['info']['nickname']
	  user.email = auth['info']['email']
	  user.image_url = auth['info']['image']
	  user.save!
	end

end

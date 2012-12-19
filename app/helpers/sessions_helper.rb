module SessionsHelper
	def sign_in(user)
		self.current_user = user
		cookies.permanent[:remember_token1] = user.id
		user.user_actions.build(action: "web login", ip: request.remote_ip).save
	end

	def sign_out
		self.current_user.user_actions.build(action: "web logout", ip: request.remote_ip).save
		self.current_user = nil
		cookies.delete(:remember_token1)
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user?(user)
		current_user == user
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= Employee.find_by_id(cookies[:remember_token1])
	end
end
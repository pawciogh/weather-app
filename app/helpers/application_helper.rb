module ApplicationHelper
	def weather_message(number)
		if number > @temperature.warm_top_temp 
			'Hot' 
		elsif number < @temperature.warm_bottom_temp 
			'Cold' 
		else
			'Warm'
		end
	end

	def admin?
    user_signed_in? && current_user.admin
  end
end

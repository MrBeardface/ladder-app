module ApplicationHelper
	def active_page(page,action)
	  if controller.controller_name.to_s == page && controller.action_name.to_s == action
	    "class=active"
		end
	end

	def distance_of_time_in_days(from_time, to_time = 0)
		from_time = from_time.to_time if from_time.respond_to?(:to_time)
		to_time = to_time.to_time if to_time.respond_to?(:to_time)
		from_time, to_time = to_time, from_time if from_time > to_time
		distance_in_days = (((to_time - from_time).abs) / 86400).round
	end

	def display_phone(phone_number)
		unless phone_number.blank? 
			number_to_phone(phone_number.gsub(/\D/, ''), area_code: true)
		else
			'n/a'
		end
	end

	def match_date_select(days_back)

		possible_match_dates = []

		# add today
		active_date = ["Today", Date.current]
		possible_match_dates.push(active_date)

		# add yesterday
		active_date = ["Yesterday", Date.yesterday]
		possible_match_dates.push(active_date)

		# add rest of the days
		days = 2
		while days <= days_back do
			temp_date = Date.current - days
			short_date = temp_date.strftime("%A %-m/%-d")
			active_date = ["#{days} days ago: #{short_date}", temp_date]
			possible_match_dates.push(active_date)
			days +=1
		end

		# return the collection
		possible_match_dates
	end
end

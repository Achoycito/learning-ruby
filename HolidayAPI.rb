require 'ruby-holidayapi'

key = 'e10b6e96-1b96-44c7-9e1d-1fe5fbf482cd'
hapi = HolidayAPI::V1.new(key)
holidays = hapi.holidays({
	'country': 'MX',
	'year': '2023',
})
holidays.read_body
module ApplicationHelper
	def render_if(condition, record)
		if condition
			render record
		end
	end

	def converted_price(price)
  		if I18n.locale.to_s == 'en'
    		humanized_money_with_symbol(price.exchange_to('USD'))
  		elsif I18n.locale.to_s == 'es'
    		humanized_money_with_symbol(price.exchange_to('EUR'))
  		end
	end
end

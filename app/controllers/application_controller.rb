class ApplicationController < ActionController::Base
	before_action :authorize
	before_action :set_i18n_locale_from_params
	protect_from_forgery with: :exception
	rescue_from 'ActiveRecord::RecordNotFound' do |exception|
		ApplicationMailer.application_error(exception.message).deliver_later
		redirect_to store_index_url, notice: "Application error occured"
	end

	protected

	def authorize
		return if User.count.zero?
		if request.format == Mime[:html]
			unless User.find_by(id: session[:user_id])
				redirect_to login_url, notice: "Please log in"
			end
		else
			authenticate_or_request_with_http_basic do |username, password|
				user = User.find_by(name: username)
				user && user.authenticate(password)
				session[:user_id] = user.id
			end
		end
	end

	def set_i18n_locale_from_params
		if params[:locale]
			if I18n.available_locales.map(&:to_s).include?(params[:locale])
				I18n.locale = params[:locale]
			else
				flash.now[:notice] = "#{params[:locale]} translation not available"
				logger.error flash.now[:notice]
			end
		else
			I18n.locale = I18n.default_locale
		end
	end
end

module WebiniusCms
	class ApplicationController < ActionController::Base
		protect_from_forgery with: :exception

		before_action :set_locale
		
		def set_locale
			if params[:locale].present?
				lang = Language.where(code: params[:locale]).first
				I18n.locale = lang.present? ? params[:locale] : (raise ActionController::RoutingError.new('Not Found'))
			else
				@default_language ||= Language.where(status: true).first
				I18n.locale = @default_language.code
			end
		end

		private

		def current_user
			@current_user ||= User.find(session[:user_id]) if session[:user_id]
		end
		helper_method :current_user

		def authorize
			redirect_to login_url, alert: "Not authorized" if current_user.nil?
		end

	end
end

module WebiniusCms
	class ApplicationController < ActionController::Base
		protect_from_forgery with: :exception

		before_action :set_locale
		
		def set_locale
			if params[:locale].present?
				Rails.logger.info params[:locale]
				lang = Language.where(code: params[:locale]).first
				I18n.locale = lang.present? ? params[:locale] : (raise ActionController::RoutingError.new('Not Found'))
			else
				@default_language ||= Language.where(status: true, default: true).first
				I18n.locale = @default_language.code
			end
			# Rails.application.routes.default_url_options[:locale]= I18n.locale
		end

		def nested_page_path(page, args = {})
			url_params = args.present? ? "?#{args.to_query}" : ''
			"/#{I18n.locale}/" + (page.ancestors + [page]).map(&:to_param).join("/") + url_params
		end
		helper_method :nested_page_path

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

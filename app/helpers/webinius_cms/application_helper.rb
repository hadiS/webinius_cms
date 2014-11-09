module WebiniusCms
	module ApplicationHelper

		def errors_for(model, attribute)
			if model.errors[attribute].present?
				content_tag :div, content_tag(:span, model.errors[attribute].first, class: 'control-label'), class: 'field_with_errors'
			end
		end
	
	end
end

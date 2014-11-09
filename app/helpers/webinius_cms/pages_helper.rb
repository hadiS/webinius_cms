module WebiniusCms
	module PagesHelper
		
		def list_nested_pages(pages)
			pages.map do |page, sub_pages|
				render(page) + list_nested_pages(sub_pages)
			end.join.html_safe
		end

		def set_lang(receiver, method_name)
			text = receiver.send("#{I18n.locale}_#{method_name}")
			text.present? ? text : receiver.send("de_#{method_name}")
		end
		
	end
end

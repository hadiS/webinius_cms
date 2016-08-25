module WebiniusCms
  module ApplicationHelper

    def errors_for(model, attribute)
      if model.errors[attribute].present?
        content_tag :div, content_tag(:span, model.errors[attribute].first, class: 'control-label'), class: 'field_with_errors'
      end
    end

    def list_nested_pages(pages)
      pages.map do |page, sub_pages|
        render(page) + list_nested_pages(sub_pages)
      end.join.html_safe
    end

    def set_lang(receiver, method_name)
      text = receiver.send("#{I18n.locale}_#{method_name}")
      text.present? ? text : receiver.send("de_#{method_name}")
    end

    def nested_page_path(page, slug = nil, args = {})
      url_params = args.present? ? "?#{args.to_query}" : ''
      path = "/#{I18n.locale}/" + page.send(:"#{I18n.locale}_slug")
      path << "/#{slug}" if slug
      path << url_params
    end

  end
end

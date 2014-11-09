module WebiniusCms
  class Engine < ::Rails::Engine
    isolate_namespace WebiniusCms

    config.active_record.schema_format = :sql
    config.assets.precompile += %w( webinius_cms/admin.css webinius_cms/admin.js webinius_cms/sites.css webinius_cms/sites.js tinymce/tinymce.min.js )
    I18n.config.enforce_available_locales = false
  end
end

class InitializeCmsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_files
    copy_file 'helpers/webinius_cms/pages_helper.rb', 'app/helpers/webinius_cms/pages_helper.rb'
    copy_file 'views/layouts/webinius_cms/sites.html.erb', 'app/views/layouts/webinius_cms/sites.html.erb'
    copy_file 'views/layouts/webinius_cms/_admin_top_navigation.html.erb', 'app/views/layouts/webinius_cms/_admin_top_navigation.html.erb'
  end
end

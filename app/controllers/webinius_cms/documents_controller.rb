require_dependency "webinius_cms/application_controller"

module WebiniusCms
  class DocumentsController < ApplicationController

    def show
      @document = Document.find(params[:id])
      send_file @document.document.path, disposition: 'inline'
    end

  end
end

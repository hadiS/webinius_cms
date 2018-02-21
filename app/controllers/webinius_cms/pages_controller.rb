require_dependency "webinius_cms/application_controller"

module WebiniusCms
  class PagesController < ApplicationController
    layout 'webinius_cms/admin'

    before_action :authorize, except: :show
    before_action :set_page, only: [:show]
    before_action :set_page_with_id, only: [:update, :edit, :destroy, :higher, :lower]
    before_action :lookup_partials, only: [:new, :edit, :create, :update]

    # GET /pages
    # GET /pages.json
    def index
      @pages = Page.arrange(order: :position)
    end

    # GET /pages/1
    # GET /pages/1.json
    def show
      render layout: 'webinius_cms/sites'
    end

    # GET /pages/new
    def new
      @page = Page.new(parent_id: params[:parent_id])
      @page.documents.build
      @page.images.build
    end

    # GET /pages/1/edit
    def edit
      @page.documents.build
      @page.images.build
    end

    # POST /pages
    # POST /pages.json
    def create
      @page = Page.new(page_params)

      respond_to do |format|
        if @page.save
          format.html { redirect_to pages_url, notice: 'New Page was created.' }
          format.json { render action: 'show', status: :created, location: @page }
        else
          @page.documents.build unless @page.documents.any?
          @page.images.build unless @page.images.any?
          format.html { render action: 'new' }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /pages/1
    # PATCH/PUT /pages/1.json
    def update
      @page.docs = params[:page][:docs] if params[:page][:docs].present?
      @page.ancestry = nil
      respond_to do |format|
        if @page.update(page_params)
          format.html { redirect_to pages_url, notice: 'Page was updated successfully.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /pages/1
    # DELETE /pages/1.json
    def destroy
      @page.destroy
      respond_to do |format|
        format.html { redirect_to pages_url }
        format.json { head :no_content }
      end
    end

    def higher
      @page.move_higher
      redirect_to pages_path
    end

    def lower
      @page.move_lower
      redirect_to pages_path
    end

    private
      def lookup_partials
        @partials = Dir[Rails.root.join("app", "views", 'webinius_cms', 'pages', 'partials', '*.html.erb').to_s].collect do |path|
          File.basename(path, '.html.erb').gsub(/_/, '')
        end
        @partials << 'standard' if @partials.blank?
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_page
        if params[:id]
          @page = Page.where("properties @> hstore(?, ?)", "#{I18n.locale}_slug", params[:id]).first
          if @page.blank?
            slug_parts = params[:id].split('/')
            item_list_id = slug_parts.slice(-1)
            page_id = slug_parts.slice(0, slug_parts.size-1)

            @page = Page.where("properties @> hstore(?, ?)", "#{I18n.locale}_slug", page_id.join('/')).first
            @list_item = ListItem.where("properties @> hstore(?, ?)", "#{I18n.locale}_slug", item_list_id).first
          end
        else
          @page = Page.roots.online.first
        end
      end

      def set_page_with_id
        @page = Page.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def page_params
        langs = Language.all
        dynamic_fields = %w[title content meta_description slug description].collect do |field|
          lang_field = []
          langs.each do |lang|
            lang_field << "#{lang.code}_#{field}"
          end
          lang_field
        end.flatten!
        params.require(:page).permit(:parent_id, :status, :map_address, :kind, :picture, :navigation_type,
          :remove_picture, :picture, :picture_cache, :docs, :is_news, *dynamic_fields, documents_attributes: [:id, :name, :document, :document_cache, :_destroy], images_attributes: [:id, :title, :image, :image_cache, :_destroy, :description])
      end
  end
end

require_dependency "webinius_cms/application_controller"

module WebiniusCms
  class ListItemsController < ApplicationController
    layout 'webinius_cms/admin'

    before_action :authorize
    before_action :set_list, only: [:index, :create, :new, :edit, :update, :destroy]
    before_action :set_list_item, only: [:show, :edit, :update, :destroy]

    # GET /list_items
    def index
      @list_items = @list.list_items
    end

    # GET /list_items/1
    def show
    end

    # GET /list_items/new
    def new
      @list_item = ListItem.new
      @list_item.documents.build
    end

    # GET /list_items/1/edit
    def edit
      @list_item.documents.build
    end

    # POST /list_items
    def create
      @list_item = ListItem.new(list_item_params)
      @list_item.list = @list

      if @list_item.save
        redirect_to list_list_items_url, notice: 'List item was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /list_items/1
    def update
      if @list_item.update(list_item_params)
        redirect_to list_list_items_url, notice: 'List item was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /list_items/1
    def destroy
      @list_item.destroy
      redirect_to list_list_items_url, notice: 'List item was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_list_item
        @list_item = ListItem.find(params[:id])
      end

      def set_list
        @list = List.find(params[:list_id])
      end

      # Only allow a trusted parameter "white list" through.
      def list_item_params
        langs = Language.all
        dynamic_fields = %w[title content meta_description slug description].collect do |field|
          lang_field = []
          langs.each do |lang|
            lang_field << "#{lang.code}_#{field}"
          end
          lang_field
        end.flatten!
        params.require(:list_item).permit(:status, :remove_picture, :picture, :picture_cache, :is_news, *dynamic_fields, documents_attributes: [:id, :name, :document, :document_cache, :_destroy])
      end
  end
end

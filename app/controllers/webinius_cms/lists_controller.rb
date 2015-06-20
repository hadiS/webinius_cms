require_dependency "webinius_cms/application_controller"

module WebiniusCms
  class ListsController < ApplicationController
    layout 'webinius_cms/admin'

    before_action :set_list, only: [:show, :edit, :update, :destroy]

    # GET /lists
    def index
      @lists = List.all
    end

    # GET /lists/1
    def show
    end

    # GET /lists/new
    def new
      @list = List.new
    end

    # GET /lists/1/edit
    def edit
    end

    # POST /lists
    def create
      @list = List.new(list_params)

      if @list.save
        # unless File.exists?(Rails.root.join("app", "views", 'webinius_cms', 'pages', 'partials', "_#{@list.name.parameterize}.html.erb").to_s)
        #   File.open(Rails.root.join("app", "views", 'webinius_cms', 'pages', 'partials', "_#{@list.name.parameterize}.html.erb").to_s, "w").close
        # end
        redirect_to lists_url, notice: 'List was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /lists/1
    def update
      if @list.update(list_params)
        redirect_to lists_url, notice: 'List was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /lists/1
    def destroy
      @list.destroy
      # if File.exists?(Rails.root.join("app", "views", 'webinius_cms', 'pages', 'partials', "_#{@list.name.parameterize}.html.erb").to_s)
      #   File.delete(Rails.root.join("app", "views", 'webinius_cms', 'pages', 'partials', "_#{@list.name.parameterize}.html.erb").to_s)
      # end
      redirect_to lists_url, notice: 'List was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_list
        @list = List.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def list_params
        params.require(:list).permit(:name, :webinius_cms_page_id)
      end
  end
end

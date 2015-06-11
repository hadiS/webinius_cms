require_dependency "webinius_cms/application_controller"

module WebiniusCms
	class LanguagesController < ApplicationController
		layout 'webinius_cms/admin'

		before_action :authorize

		before_action :set_language, only: [:show, :edit, :update, :destroy]

		# GET /languages
		# GET /languages.json
		def index
			@languages = Language.order('created_at ASC')
		end

		# GET /languages/1
		# GET /languages/1.json
		def show
		end

		# GET /languages/new
		def new
			@language = Language.new
		end

		# GET /languages/1/edit
		def edit
		end

		# POST /languages
		# POST /languages.json
		def create
			@language = Language.new(language_params)

			respond_to do |format|
        if @language.save
          if @language.default
            Language.restore_default(@language)
          end
					format.html { redirect_to languages_url, notice: 'Language was created successfully.' }
					format.json { render action: 'show', status: :created, location: @language }
				else
					format.html { render action: 'new' }
					format.json { render json: @language.errors, status: :unprocessable_entity }
				end
			end
		end

		# PATCH/PUT /languages/1
		# PATCH/PUT /languages/1.json
		def update
			respond_to do |format|
				if @language.update(language_params)
          if @language.default
            Language.restore_default(@language)
          end
					format.html { redirect_to languages_url, notice: 'Language was updated successfully.' }
					format.json { head :no_content }
				else
					format.html { render action: 'edit' }
					format.json { render json: @language.errors, status: :unprocessable_entity }
				end
			end
		end

		# DELETE /languages/1
		# DELETE /languages/1.json
		def destroy
			@language.destroy
			respond_to do |format|
				format.html { redirect_to languages_url }
				format.json { head :no_content }
			end
		end

		private
			# Use callbacks to share common setup or constraints between actions.
			def set_language
				@language = Language.find(params[:id])
			end

			# Never trust parameters from the scary internet, only allow the white list through.
			def language_params
				params.require(:language).permit(:name, :code, :status, :default)
			end

	end
end

module WebiniusCms
	class Page < ActiveRecord::Base
		has_ancestry

		#mount_uploader :picture, PageImagesUploader

		acts_as_list scope: [:ancestry]

		# validates :de_title, uniqueness: true, presence: true, exclusion: {in: %w[admin login]}
		validates_presence_of :de_title

		before_validation :generate_slug

		scope :online, -> { where(status: true) }
		scope :navigation_footer, -> { where(navigation_type: 'footer') }
		scope :navigation_main, -> { where(navigation_type: 'main') }

		Language.all.each do |lang|
			["#{lang.code}_title", "#{lang.code}_content", "#{lang.code}_meta_description"].each do |key|
				# scope "has_#{key}", lambda { |value| where("properties @> hstore(?, ?)", key, value) }
				
				define_method(key) do
					properties && properties[key]
				end
			
				define_method("#{key}=") do |value|
					self.properties = (properties || {}).merge(key => value)
				end
			end	
		end

		def to_param
			slug
		end

		def generate_slug
			self.slug = en_title.parameterize
		end

		def method_missing(method, *args, &block)
			if method.to_s =~ /.*_(title|content|meta_description)$/
				# scope "has_#{key}", lambda { |value| where("properties @> hstore(?, ?)", key, value) }
				Page.instance_eval do 
					define_method(method.to_s) do
						properties && properties[method.to_s]
					end
					
					define_method("#{method.to_s}=") do |value|
						self.properties = (properties || {}).merge(method.to_s => value)
					end
				end
				send(method, *args)
			else
				super
			end
		end
	end
end

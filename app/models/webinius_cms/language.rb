module WebiniusCms
  class Language < ActiveRecord::Base

    def self.restore_default(language)
      languages = Language.where.not(id: language.id)
      languages.each do |la|
        la.default = false
        la.save
      end
    end

  end
end

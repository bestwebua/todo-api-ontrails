module Api
  class DocSelectorService
    def self.call(version)
      Rails.public_path.join('docs', "#{version}.html")
    end
  end
end

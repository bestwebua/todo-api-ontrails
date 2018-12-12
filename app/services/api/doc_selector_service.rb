module Api
  class DocSelectorService
    def self.call(controller_object)
      current_version = controller_object.class.parent.to_s.downcase
      Rails.public_path.join('docs', "#{current_version}.html")
    end
  end
end

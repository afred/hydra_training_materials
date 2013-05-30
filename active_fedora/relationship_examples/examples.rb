class Examples < ActiveFedora::Base

  @@example_model_class_names = ['Item', 'Collection']

  # Little helper method to delete our example objects.
  def self.delete_all
    ActiveFedora::Base.find_each do |obj|
      @@example_model_class_names.each do |class_name|
        obj.delete if obj.relationships(:has_model).include? "info:fedora/afmodel:#{class_name}"
      end
    end
  end

end
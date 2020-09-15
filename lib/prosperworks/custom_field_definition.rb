module ProsperWorks
  class CustomFieldDefinitionOption < Base
    attr_accessor :name,
                  :rank
  end
  
  class CustomFieldValue < Base
    attr_accessor :field_name,
                  :value
                  :data_type
  end
  
  class CustomFieldDefinition < Base
  

    attr_accessor :name,
                  :data_type,
                  :available_on
    attr_writer   :options
                  
    def self.api_name
      "custom_field_definitions"
    end

    extend ApiOperations::Find
    extend ApiOperations::List
    
    def options
      @custom_options ||= @options.map do |hash|
        CustomFieldDefinitionOption.new(hash)
      end unless @options.nil?
    end
    
  end
end
module ProsperWorks

  class CustomFieldDefinition < Base

    attr_accessor :name,
                  :data_type,
                  :available_on,
                  :options
                  
    def self.api_name
      "custom_field_definitions"
    end

    extend ApiOperations::Find
    extend ApiOperations::List
  end
end
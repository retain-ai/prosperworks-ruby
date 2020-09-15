module ProsperWorks
  class BaseEntity < Base

    # used for the 6 main entity types

    attr_accessor :assignee_id,
                  :date_modified,
                  :details,
                  :name,
                  :tags

    attr_writer   :custom_fields

    extend ApiOperations::Create
    extend ApiOperations::Delete
    extend ApiOperations::Find
    extend ApiOperations::Update
    extend ApiOperations::Search
    
    
    def custom_fields
      return @custom_fields unless @@custom_fields
      @custom_field_values ||= @custom_fields.map do |field|
        field_id = field["custom_field_definition_id"]
        if @@custom_fields.include? field_id
            custom = @@custom_fields[field_id]
            if custom.options
                option = custom.options.select{|o| o.id == field["value"]}.first
                value = option&.name
            else
                value = field["value"]
            end
            { 
              id => 
                CustomFieldValue.new({ 
                  field_name: custom.name,
                  value: value,
                  id: option&.id,
                  data_type: custom.data_type
                }) 
            }
        end
      end.reduce(Hash.new, :merge)
      
    end
  end
end

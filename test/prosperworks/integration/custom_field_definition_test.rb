require 'test_helper'

class CustomFieldDefinitionTest < Minitest::Test
  include Helpers
  
  def verify_response(expected, actual)
    assert actual.is_a?(ProsperWorks::CustomFieldDefinition)
    assert_equal expected[:id], actual.id
    assert_equal expected.keys.length, actual.instance_variables.length
    
    expected.each do|key, value|
      next if value.is_a?(Enumerable)
      if value.nil?
        assert_nil actual.send(key)
      else
        assert_equal value, actual.send(key)
      end
    end
    
    case expected[:options]
    when nil
      assert_nil actual.options
    else
      expected[:options].zip(actual.options).each do |defined,option|
        defined.each do |key, value|
          if value.nil?
            assert_nil option.send(key)
          else
            assert_equal value, option.send(key)
          end
        end
      end
    end
  end
  
  def setup
    @id = custom_field_definition_details[:id]
    @single_resource_url = get_uri(ProsperWorks::CustomFieldDefinition.api_name, @id)
    @list_url = get_uri(ProsperWorks::CustomFieldDefinition.api_name)
  end
  
  def test_custom_field_definition_list
    stub_request(:get, @list_url).with(headers: headers)
                                 .to_return(status: 200, body: custom_field_definition_list_payload)
    fields = ProsperWorks::CustomFieldDefinition.list
    custom_field_definition_list_details.zip(fields).each do |expected, field|
      verify_response(expected, field)
    end
  end
  
  def test_custom_field_definition_find
    stub_request(:get, @single_resource_url).with(headers: headers)
                                 .to_return(status: 200, body: custom_field_definition_payload)
    field = ProsperWorks::CustomFieldDefinition.find(@id)
    verify_response(custom_field_definition_details, field)
  end
end
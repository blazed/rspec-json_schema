require 'rspec/core'

RSpec::Matchers.define :match_schema do |expected|
  match do |actual|
    parse_and_validate(expected, actual)[0]
  end

  failure_message do |actual|
    parse_and_validate(expected, actual)[1].map{|e|
      str = "Error in #{e.path.join('/')} #{e.type}: #{e.message}"
      if sub_errors
        e.sub_errors[1].each do |sub_e|
          str += "\n";
          str += "Description #{sub_e.schema.
            &(:data).
            &(:[], "properties").
            &(:[], "type").
            &(:[], "id")}\n"
          str += "\t\t Error in #{sub_e.path.join('/')} #{sub_e.type}: #{sub_e.message}"
        end
      end

      str
    }.join("\n")
  end

  def parse_and_validate(schema, json)
    schema_directory = "#{Rails.root}/spec/schemas"
    schema_path = "#{schema_directory}/#{schema.gsub('.json', '')}.json"

    schema = JsonSchema.parse!(JSON.parse(File.read(schema_path)))
    schema.expand_references!(store: $document_store)

    return schema.validate(
      json.is_a?(String) ? JSON.parse(json) : json
    )
  end
end

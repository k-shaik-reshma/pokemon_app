# frozen_string_literal: true

class TypeApiService
  # fetching type data from poke-api-v2 gem
  def self.fetch_types
    type_data = PokeApi.get(:type).results
    type_data.each do |type_item|
      build_type(type_item)
    end
  end

  def self.build_type(type_item)
    type = Type.find_or_initialize_by(name: type_item.name)
    return type if type.save!

    Rails.logger.error "Failed for type #{type.errors}"
  end
end

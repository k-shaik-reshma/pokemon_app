# frozen_string_literal: true

module Commands
  class Command
    include ActiveModel::Validations

    attr_accessor :token

    def initialize(attributes = {})
      attributes.each do |name, value|
        method("#{name}=".to_sym).call(value) if methods.include? "#{name}=".to_sym
      end
    end

    # this method can be ovveridden in other classes
    def execute; end
  end
end

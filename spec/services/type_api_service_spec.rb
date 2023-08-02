# frozen_string_literal: true

# spec/services/type_api_service_spec.rb
require 'rails_helper'

RSpec.describe TypeApiService do
  describe '.fetch_types' do
    let(:type_data) { double(results: type_items) }
    let(:type_items) { [double(name: 'Fire'), double(name: 'Water')] }

    before do
      allow(PokeApi).to receive(:get).with(:type).and_return(type_data)
    end

    it 'calls build_type for each type item' do
      type_items.each do |type_item|
        expect(TypeApiService).to receive(:build_type).with(type_item)
      end
      TypeApiService.fetch_types
    end
  end

  describe '.build_type' do
    context 'when the type does not exist' do
      it 'creates a new type' do
        expect do
          TypeApiService.build_type(double(name: 'Fire'))
        end.to change { Type.count }.by(1)
      end
    end

    context 'when the type already exists' do
      let!(:existing_type) { Type.create(name: 'Water') }

      it 'finds the existing type' do
        expect do
          TypeApiService.build_type(double(name: 'Water'))
        end.not_to(change { Type.count })
      end

      it 'returns the existing type' do
        type = TypeApiService.build_type(double(name: 'Water'))
        expect(type).to eq(existing_type)
      end
    end
  end
end

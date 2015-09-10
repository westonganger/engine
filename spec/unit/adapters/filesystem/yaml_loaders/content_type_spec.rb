require 'spec_helper'

require_relative '../../../../../lib/locomotive/steam/adapters/filesystem/yaml_loader.rb'
require_relative '../../../../../lib/locomotive/steam/adapters/filesystem/yaml_loaders/content_type.rb'

describe Locomotive::Steam::Adapters::Filesystem::YAMLLoaders::ContentType do

  let(:site_path) { default_fixture_site_path }
  let(:loader)    { described_class.new(site_path) }

  describe '#load' do

    let(:scope) { instance_double('Scope', locale: :en) }

    subject { loader.load(scope).sort { |a, b| a[:slug] <=> b[:slug] } }

    it 'tests various stuff' do
      expect(subject.size).to eq 5
      expect(subject.first[:slug]).to eq('bands')
      expect(subject.first[:entries_custom_fields].size).to eq 5
      expect(subject.first[:entries_custom_fields].first[:position]).to eq 0
    end

  end

end
RSpec.describe RedirectPermission::Url do
  describe '#permitted' do
    subject { instance.permitted }
    let(:instance) { described_class.new(url: url, hosts: hosts, default: default) }

    let(:hosts) { ['example.com'] }
    let(:default) { 'https://example.com' }

    context 'direct valid' do
      let(:url) { 'https://example.com/foo/bar' }
      it { is_expected.to eq url }
    end

    context 'relative valid' do
      let(:url) { '/foo/bar' }
      it { is_expected.to eq "#{default}#{url}" }
    end
  end
end

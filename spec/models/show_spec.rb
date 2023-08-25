require "rails_helper"

RSpec.describe Show, type: :model do
  describe 'relationships' do
    it { should belong_to :streaming_service }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :genre }
    it { should allow_value(true).for(:released)}
    it { should allow_value(false).for(:released)}
    it { should validate_presence_of :episodes }
    it { should validate_presence_of :seasons }
    it { should validate_presence_of :episode_runtime }
  end
end
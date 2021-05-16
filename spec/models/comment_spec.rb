require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'model definition' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to belong_to(:post) }
  end
end

require 'rails_helper'

RSpec.describe Author, type: :model do
  context 'model definition' do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to validate_presence_of(:name) }
  end
end

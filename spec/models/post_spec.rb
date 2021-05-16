require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'model definition' do
    it { is_expected.to belong_to(:author) }
    it { is_expected.to enumerize(:category).in(Post::CATEGORIES) }
    it { is_expected.to have_rich_text(:content) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:category) }
  end
end

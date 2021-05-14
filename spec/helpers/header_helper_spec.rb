require 'rails_helper'

describe HeaderHelper do
  context '#blog_categories' do
    subject { helper.blog_categories.join('') }

    it { is_expected.to include(Post::CATEGORIES.sample.to_s) }
  end
end

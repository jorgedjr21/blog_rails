require 'rails_helper'

RSpec.feature 'Blog posts', type: :feature do
  let!(:post) { create(:post) }

  before do
    visit '/'
  end

  subject { page }

  it { is_expected.to have_css('h2.blog-post-title', count: 1) }
  it { is_expected.to have_css('h2.blog-post-title', text: post.title) }
  it { is_expected.to have_css("p.blog-post-meta", text: "#{post.description}") }
  it { is_expected.to have_css('div.col-md-7.text-center', text: "#{time_ago_in_words post.created_at} by #{post.author.name}") }
  it { is_expected.to have_css("span.badge.badge-#{post.category}", text: "#{post.category}") }
end

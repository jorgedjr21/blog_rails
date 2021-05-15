require "rails_helper"

RSpec.describe "Posts admin section", :type => :request do
  context 'GET /admin/posts/new' do
    subject { get '/admin/posts/new' }

    it { is_expected.to render_template(:new) }
  end

  context 'POST /admin/posts' do
    subject { post '/admin/posts', params: params }
    context 'with valid params' do
      let(:params) {
        {
          post: attributes_for(:post).except(:author).merge(author_id: create(:author).id)
        }
      }

      it 'must create a new post' do
        expect { subject }.to change(Post, :count).by(1)
      end

      it 'must create a post with the valid attributes' do
        subject
        expect(Post.last).to have_attributes(params[:post].except(:content))
      end

      it { is_expected.to redirect_to(admin_posts_path) }
    end

    context 'with invalid params' do
      let(:params) {
        {
          post: {
            title: '',
            description: '',
            author_id: '',
            content: ''
          }
        }
      }

      it 'must not create a new post' do
        expect { subject }.not_to change(Post, :count)
      end

      it { is_expected.to render_template(:new) }
    end
  end
end

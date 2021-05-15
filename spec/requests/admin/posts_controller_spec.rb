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

  context 'PUT /admin/posts/:id' do
    let!(:post) { create(:post) }
    subject { put "/admin/posts/#{post.id}", params: params }

    context 'with valid params' do
      let(:params) {
        {
          post: {
            title: 'New Title',
            description: 'new Description'
          }
        }
      }

      it 'must update the existing post' do
        expect {
          subject
          post.reload
        }.to change { post.title }.from(post.title).to('New Title')
         .and change { post.description }.from(post.description).to('new Description')
      end

      it { is_expected.to redirect_to(admin_posts_path) }
    end

    context 'with invalid params' do
      let(:params) {
        {
          post: {
            title: '',
            description: ''
          }
        }
      }

      it 'must not update the existing post' do
        expect {
          subject
          post.reload
        }.not_to change { post }
      end

      it { is_expected.to render_template(:edit) }
    end
  end
end

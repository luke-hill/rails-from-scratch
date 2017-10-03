require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #show' do
    let(:valid_post) { Post.create(title: 'Title One', body: 'HELLO Welcome to my blog!!!!!!') }

    it 'should assign the post to an instance variable' do
      get :show, params: { id: valid_post.id }
      
      expect(assigns(:post)).to eq(valid_post)
    end

    it 'should blow up with an invalid input' do
      expect { get :show, params: { id: 0 } }
        .to raise_error(ActiveRecord::RecordNotFound)
        .with_message("Couldn't find Post with 'id'=0")
    end
  end
end

require_relative '../rails_helper'
 
RSpec.describe Post, type: :model do
  context 'title' do
    let(:valid_post) { Post.create(title: 'Title One', body: 'HELLO Welcome to my blog!!!!!!') }
    let(:invalid_post) { Post.create(title: 'Title 1', body: 'HELLO Welcome to my blog!!!!!!') }

    it 'must exist' do
      expect(valid_post.title).to eq('Title One')
    end
    
    it 'cannot contain numbers' do
      expect(invalid_post.errors).to have_key(:title)
    end
  end
  
  context 'body' do
    let(:valid_post) { Post.create(title: 'Title One', body: 'HELLO Welcome to my blog!!!!!!') }
    let(:invalid_post) { Post.create(title: 'Title One', body: 'HELLO!') }
    let(:invalid_post_two) { Post.create(title: 'Title One', body: 'WTFBBQ£$%*££') }

    it 'must exist' do
      expect(valid_post.body).to eq('HELLO Welcome to my blog!!!!!!')
    end
    
    it 'cannot be less than 10 characters' do
      expect(invalid_post.errors).to have_key(:body)
    end
    
    it 'cannot contain invalid characters' do
      expect(invalid_post_two.errors).to have_key(:body)
    end
  end
end

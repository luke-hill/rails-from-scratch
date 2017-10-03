require 'rails_helper'
 
RSpec.describe Post, type: :model do
  let(:valid_post) { Post.create(title: 'Title One', body: 'HELLO Welcome to my blog!!!!!!') }
  
  context 'title' do
    let(:invalid_post) { Post.create(title: 'Title 1', body: 'HELLO Welcome to my blog!!!!!!') }

    it 'must exist' do
      expect(valid_post.title).to eq('Title One')
    end
    
    it 'cannot contain numbers' do
      expect(invalid_post.errors).to have_key(:title)
    end
  end
  
  context 'body' do
    let(:short_post) { Post.create(title: 'Title One', body: 'HELLO!') }
    let(:post_with_symbols) { Post.create(title: 'Title One', body: 'WTFBBQ£$%*££') }

    it 'must exist' do
      expect(valid_post.body).to eq('HELLO Welcome to my blog!!!!!!')
    end
    
    it 'cannot be less than 10 characters' do
      expect(short_post.errors).to have_key(:body)
    end
    
    it 'cannot contain invalid characters' do
      expect(post_with_symbols.errors).to have_key(:body)
    end
  end
end

class Post < ApplicationRecord
  validates :title, format: { with: /\A[a-zA-Z ]+\z/, message: 'only allows letters' }
  validates :body, format: { with: /\A[^£$%*]*\z/, message: 'cannot contain invalid characters' }
  validates :body, length: { minimum: 10 }
end

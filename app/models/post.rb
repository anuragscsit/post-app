class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	has_many :like_posts, dependent: :destroy
	validates :article, :description, presence: true

	belongs_to :user

	def liked?(user)
		!!self.like_posts.find{|like| like.user_id == user.id}
		
	end
end

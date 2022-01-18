class DropLikePosts < ActiveRecord::Migration[6.0]
  def change
    drop_table :like_posts
  end
end

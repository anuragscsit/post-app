# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |post|
	puts "creating post #{post+1}"
	Post.create(article: "article #{post+1}", description: "This is description of #{post+1}th post", user_id: 1)

end

# Post.all.each do |comment|
# 	i=1

# 	comment.comments.create(comment_description: "this is dummy comment #{i+1} ")
# 	comment.comments.create(comment_description: "this is dummy comment #{i+2} ")
# end
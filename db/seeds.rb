# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(
  email: 'masfandyar44@gmail.com',
  password: 'asfandyardev',
  password_confirmation: 'asfandyardev',
  role: 'admin'
)
user.skip_confirmation!
user.save!

User.create(
  email: 'muhammad.asfandyar@devsinc.com',
  password: 'asfandyardev',
  password_confirmation: 'asfandyardev',
  role: 'moderator'
)

User.create(
  email: 'asfu1011@gmail.com.com',
  password: 'asfandyardev',
  password_confirmation: 'asfandyardev',
  role: 'user'
)

Post.create(title: 'post1',
            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                           labore et doloremagna aliqua.',
            content: 'dumy contentLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                       incididunt ut labore et doloremagna aliqua.',
            user_id: 1)

Post.create(title: 'post2',
            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                             labore et doloremagna aliqua.',
            content: 'dumy contentLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                         incididunt ut labore et doloremagna aliqua.',
            user_id: 1)

Post.create(title: 'post3',
            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                               labore et doloremagna aliqua.',
            content: 'dumy contentLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                           incididunt ut labore et doloremagna aliqua.',
            user_id: 1)

Comment.create(body: 'nice', post_id: 1, user_id: 1)
Comment.create(body: 'good', post_id: 2, user_id: 1)
Comment.create(body: 'great', post_id: 2, user_id: 1)

Suggestion.create(user_id: 1, post_id: 1, body: 'test suggestion 1')
Suggestion.create(user_id: 1, post_id: 2, body: 'test suggestion 2')
Suggestion.create(user_id: 1, post_id: 2, body: 'test suggestion 3')

Like.create(user_id: 1, likeable_id:1, likeable_type: Post.find_by(id: 1))

Report.create(user_id: 1, reportable_id:1, reportable_type: Post.find_by(id: 1))

namespace :dev do
  task fake_restaurant: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample
      )
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end

  task fake_user: :environment do
    User.where(role: nil).delete_all
    20.times do |i|
      user_name = FFaker::Name.first_name
      User.create!(
      name: user_name,
      email: "#{user_name}@example.com",
      password: "12345678"
      )
    end
    puts "have created fake users"
    puts "now you have #{User.count} data"
  end


  task fake_comment: :environment do
    Comment.delete_all
    Restaurant.all.each do |restaurant|
      3.times do |i|
        restaurant.comments.create!(
        content: FFaker::Lorem.sentence,
        user: User.all.sample)
      end
    end
    puts "have created fake comments"
    puts "now you have #{Comment.count} comments"

  end


  task fake_favorite: :environment do
    Favorite.delete_all
    User.all.each do |user|
      10.times do |i|
        user.favorites.create!(
        restaurant: Restaurant.all.sample,
        )
      end
    end
      puts "have created fake favorite"
      puts "now you have #{Favorite.count} favorited restaurants"
  end

  task fake_like: :environment do
    User.all.each do |user|
      10.times do |i|
        user.likes.create!(
        restaurant: Restaurant.all.sample,
        )
      end
    end
      puts "have created fake like"
      puts "now you have #{Like.count} liked restaurants"
  end

  task fake_follow: :environment do
    Followship.delete_all
    puts "you have destroy all followship"
    User.all.each do |user|
      3.times do |i|
        user.followships.create!(
        following: User.all.sample,
        )
      end
    end
      puts "now you have #{Followship.count} data created"
  end

  task fake_friend: :environment do
    Friendship.delete_all
    puts "you have destroy all friendship"
    User.all.each do |user|
      3.times do |i|
        user.friendships.create!(
        friend: User.all.sample,
        )
      end
    end
      puts "now you have #{Friendship.count} data created"
  end

  task fake_destroy: :environment do
    User.where(name: nil).delete_all
    puts "now you have destroy no name user"
  end



end

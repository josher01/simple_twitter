namespace :dev do
    task fake_users: :environment do
      User.destroy_all
      url = "https://uinames.com/api/?ext&region=england"
      20.times do |i|
        response = RestClient.get(url)
        data = JSON.parse(response.body)
        user_name = FFaker::Name.first_name
        user = User.create!(
          name: user_name,
          email: "#{user_name}@example.com",
          password: "12345678",
          avatar: data["photo"],
          introduction: FFaker::Lorem.sentences
          )
      end
    puts "#{User.count} users created !"
    end

    task fake_tweets: :environment do
      Tweet.destroy_all
      50.times do |i|
        tweet = Tweet.create!(
          description: FFaker::Lorem.paragraph,
          user: User.all.sample,
          created_at: FFaker::Time.datetime
          )
      end
      puts "#{Tweet.count} tweets created !"
    end

    task fake_replies: :environment do 
      Reply.destroy_all
      Tweet.all.each do |tweet|
        3.times do |i|
          reply = tweet.replies.create!(
            comment: FFaker::Lorem.sentence,
            user: User.all.sample,
            created_at: FFaker::Time.datetime
            )
        end
      end
      puts "#{Reply.count} tweets created !"
    end

    task fake_likes: :environment do
      Like.destroy_all
      Tweet.all.each do |tweet|
        5.times do |i|
          like = tweet.likes.create!(
            user: User.all.sample,
            created_at: FFaker::Time.datetime
            )
        end
      end
      puts "#{Like.count} likes created !"
    end

    task fake_followships: :environment do
      Followship.destroy_all
      30.times do |i|
        followship = Followship.create!(
          user_id: User.all.sample.id,
          following_id: User.all.sample.id
          )
      end
      puts "#{Followship.count} followships created !"
    end

end
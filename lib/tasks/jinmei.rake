namespace :jinmei do
  desc "Grant a given user admin privilege. "
  task :make_admin, [:email] => :environment do |task, args|
    email = args[:email]
    user = User.find_by_email(email)

    if user
      user.admin = true
      user.save

      puts "Successfully granted administrator privilege to user #{email}. "
    else
      puts "Cannot find such user. "
    end
  end

  desc "Adds the default categories of the site. "
  task create_categories: :environment do |task|
    Category.delete_all
    ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='categories'")

    ["关注失智", "认识尽美", "海马故事", "关注我们", "活力58", "尽美社区行", "海马大讲堂", "照护者家园", "海马志愿者", "失智照护者", "活力58人"].each do |title|
      Category.create! title: title
    end
  end
end

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
end

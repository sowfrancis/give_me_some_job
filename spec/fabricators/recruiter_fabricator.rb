Fabricator(:recruiter) do
  name     'Test User'
  email    { sequence(:email){ |i| "user_#{i}@example.com" } }
  password 'changeme'
  password_confirmation 'changeme'
  recruiterimg File.new(Rails.root.join('app', 'assets', 'images', 'Dont.png'))
end
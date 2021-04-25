# frozen_string_literal: true

if Rails.env.development?
  first_blogger =	User.create(email: 'first_blogger@blogapp.com', password: 'password')
  sec_blogger = User.create(email: 'sec_blogger@blogapp.com', password: 'password')
  admin = User.create(email: 'admin@blogapp.com', password: 'password', role: :admin)

  30.times do
    Post.create(title: Faker::Lorem.sentence(rand(2..80)).chomp('.'),
                subtitle: Faker::Lorem.sentence(rand(2..150)).chomp('.'), body: "<p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 256)}</p><p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 256)}</p><p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 256)}</p><p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 256)}</p><h2 class='section-heading'>#{Faker::Books::Lovecraft.sentence}</h2><p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 256)}</p><p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 256)}</p><blockquote class='blockquote'><p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 256)}</p></blockquote><p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 500)}</p><h2 class='section-heading'>#{Faker::Books::Lovecraft.sentence}</h2><p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 500)}</p><a href='#!'><img class='img-fluid' src='/assets/post-sample-image.jpg' alt='...' /></a> <span class='caption text-muted'>#{Faker::Books::Lovecraft.sentence}</span><p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 256)}</p> <p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 256)}</p><p>Placeholder text by <a href='http://spaceipsum.com/'> #{Faker::Books::Lovecraft.tome}</a> &middot; Images by <a href='https://www.flickr.com/photos/nasacommons/'>#{Faker::Books::Lovecraft.location}</a></p>", user: first_blogger)
    Post.create(title: Faker::Lorem.sentence(rand(2..80)).chomp('.'),
                subtitle: Faker::Lorem.sentence(rand(2..150)).chomp('.'), body: "<p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 256)}</p><p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 256)}</p><p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 256)}</p><p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 256)}</p><h2 class='section-heading'>#{Faker::Books::Lovecraft.sentence}</h2><p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 256)}</p><p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 256)}</p><blockquote class='blockquote'><p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 256)}</p></blockquote><p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 500)}</p><h2 class='section-heading'>#{Faker::Books::Lovecraft.sentence}</h2><p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 500)}</p><a href='#!'><img class='img-fluid' src='/assets/post-sample-image.jpg' alt='...' /></a> <span class='caption text-muted'>#{Faker::Books::Lovecraft.sentence}</span><p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 256)}</p> <p>#{Faker::Books::Lovecraft.paragraph_by_chars(characters: 256)}</p><p>Placeholder text by <a href='http://spaceipsum.com/'> #{Faker::Books::Lovecraft.tome}</a> &middot;Images by <a href='https://www.flickr.com/photos/nasacommons/'>#{Faker::Books::Lovecraft.location}</a></p>", user: sec_blogger)
  end

  puts 'posts successfully created.'
  puts "First Blogger login email: #{first_blogger.email}   password: 'password'"
  puts "Sec Blogger login email: #{sec_blogger.email}   password: password"
  puts "Admin login email: #{admin.email}   password: password"
end

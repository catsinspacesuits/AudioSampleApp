FactoryBot.define do
  factory :user do
    email { 'doo@d.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { true }
    confirmed_at Time.now

    trait :not_admin do
      admin { false }
    end
  end

  factory :sample do
     title { "Test Sample" }
     description { 'blah blah description here.' }
     tag_list { 'cat, rain, scotland' }
     file_type { 'wav' }
     file_size { '3.5' }
     channels { 'mono'}
     sample_rate { '96kHz/24-bit' }
     audio { Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/splash.wav') }
  end 

  factory :category do    
    name { "Nature" }
  end

  factory :library do    
    name { "Berlin Sounds" }
  end
end



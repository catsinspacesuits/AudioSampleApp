FactoryBot.define do
  factory :user do
    email { 'doo@d.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { true }
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
end



FactoryGirl.define do
  factory :user do
    factory :hotty do
      first_name 'Kelley'
      last_name 'lange'
      email 'kelley@usinternet.com'
      profile_name 'hotty'
      password 'password'
      password_confirmation 'password'
      id 10
    end
    #
    # factory :jdoe do
    #   first_name 'John'
    #   last_name 'Doe'
    #   email 'john@a.com'
    #   profile_name 'JDoe'
    #   password 'password'
    #   password_confirmation 'password'
    # end
  end
end

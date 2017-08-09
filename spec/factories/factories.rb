FactoryGirl.define do
  factory :user do
    first_name 'Firstname'
    last_name 'LastName'
    sequence(:email) {|n| 'emailn@company.com'}
    password 'Password1'
    password_confirmation 'Password1'
  end
end

FactoryGirl.define do
    factory :user do
        sequence(:name)  { |n| "Person #{n}" }
        sequence(:email) { |n| "person_#{n}@example.com"}
        password "foobar"
        password_confirmation "foobar"
    end

    factory :season do
      sequence(:name)     { |n| "Torneo #{n} liga MX" }
      sequence(:start_at) { |n| Date.today + n }
      sequence(:end_at)   { |n| Date.today + (n*10) }
    end

    factory :pool do
      sequence(:name)     { |n| "Torneo #{n} liga MX - Jornada #{n}" }
      user
    end
end

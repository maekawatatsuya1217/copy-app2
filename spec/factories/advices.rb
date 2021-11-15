FactoryBot.define do
  factory :advice do
    title       {'タイトル'}
    description {'説明'}

    association :user
  end
end

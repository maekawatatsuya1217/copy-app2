FactoryBot.define do
  factory :task do
    title       {'タイトル'}
    description {'説明'}

    association :user
  end
end

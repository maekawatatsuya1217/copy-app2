FactoryBot.define do
  factory :memo do
    title       {'タイトル'}
    description {'説明'}

    association :user
  end
end

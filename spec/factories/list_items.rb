FactoryBot.define do
  factory :list_item do
    name {"ListItem"}
    is_deleted {false}
    association :list
  end
end

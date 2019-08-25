FactoryGirl.define do
  factory :list_item do
    name "ListItem"
    is_deleted false
    list nil
  end
end

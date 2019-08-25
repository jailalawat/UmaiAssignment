require 'rails_helper'

RSpec.describe ListItem, type: :model do

  it 'has a valid FactoryBot' do
    expect(FactoryBot.build(:list_item)).to be_valid
    expect(FactoryBot.create(:list_item)).to be_valid
  end

  context 'validations' do
  	it { should validate_presence_of(:name) }
  end

  it 'applies a default scope to collections by field is_deleted false' do
    expect(ListItem.all.to_sql).to eq ListItem.unscoped.where(is_deleted: false).to_sql
  end

  it 'should get the all soft deleted list_items' do
    expect(ListItem.only_deleted.to_sql).to eq ListItem.unscoped.where(is_deleted: true).to_sql
  end

  it 'should soft delete the list_items' do
  	list_item = FactoryBot.create(:list_item)
  	list_item.destroy
  	expect(ListItem.first).to be_nil
  	expect(ListItem.only_deleted.first).to eq list_item
  end
end

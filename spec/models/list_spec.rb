require 'rails_helper'

RSpec.describe List, type: :model do
	it 'has a valid FactoryBot' do
    expect(FactoryBot.build(:list)).to be_valid
    expect(FactoryBot.create(:list)).to be_valid
  end

  context 'validations' do
  	it { should validate_presence_of(:name) }
  end

  it 'applies a default scope to collections by field is_deleted false' do
    expect(List.all.to_sql).to eq List.unscoped.where(is_deleted: false).to_sql
  end

  it 'should get the all soft deleted lists' do
    expect(List.only_deleted.to_sql).to eq List.unscoped.where(is_deleted: true).to_sql
  end

  it 'should soft delete the list' do
  	list = FactoryBot.create(:list)
  	list.destroy
  	expect(List.first).to be_nil
  	expect(List.only_deleted.first).to eq list
  end
end

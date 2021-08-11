require 'rails_helper'

RSpec.describe Travel, type: :model do
   it 'is not valid without a title' do
    new_travel1 = Travel.create title:'', content:'Anything here should be fine.'
    expect(new_travel1.errors[:title]).to_not be_empty
   end

   it 'is not valid without a content' do
    new_travel2 = Travel.create title:'Here is the title', content:''
    expect(new_travel2.errors[:content]).to_not be_empty
   end

   it 'is not valid if the title is not unique' do
    new_travel3 = Travel.create title:'China', content:'loprljfl'
    new_travel4 = Travel.create title:'China', content:'khbrmbkbmb'
    expect(new_travel4.errors[:title]).to_not be_empty
   end

   it 'is not valid if the title is less than 10 characters' do
    new_travel5 = Travel.create title:'China', content:'loprljfl'
    expect(new_travel5.errors[:title]).to_not be_empty
   end




end
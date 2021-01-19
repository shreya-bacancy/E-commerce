require 'rails_helper'

RSpec.describe UsersHelper, :type => :helper do
	 context 'signed in user' do
    before(:each) { allow(helper).to receive(:user_signed_in?){true} }

    context '#collapsible_links' do
      it "returns signed_in_links partial's path" do
        expect(helper.collapsible_links).to (
          eq 'home'
        )
      end
    end
  end

  context 'non-signed in user' do
    before(:each) { 
    allow(helper).to receive(:user_signed_in?){false}	 
     allow(helper).to receive(:supplier_signed_in?){false} }
    context '#collapsible_links' do
      it "returns non_signed_in_links partial's path" do
        expect(helper.collapsible_links).to (
          eq 'index'
        )
      end
    end
  end

  	context 'signed in supplier' do
  	before(:each) { allow(helper).to receive(:user_signed_in?){false} 
     allow(helper).to receive(:supplier_signed_in?){true} }

    context '#collapsible_links' do
      it "returns signed_in_links partial's path" do
        expect(helper.collapsible_links).to (
          eq 'supplier/index'
        )
      end
    end
  end

  

  # context 'non-signed in user' do
  #   before(:each) { helper.stub(:supplier_signed_in?).and_return(false) }
    
  #   context '#collapsible_links' do
  #     it "returns non_signed_in_links partial's path" do
  #       expect(helper.collapsible_links).to (
  #         eq 'index'
  #       )
  #     end
  #   end
  # end
  
end
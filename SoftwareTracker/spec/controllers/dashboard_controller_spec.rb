require 'rails_helper'

RSpec.describe DashboardController, :type => :controller do
  describe "#index" do
    subject(:subject) { get :index }
    
    context "when the dashboard is loaded successfully" do
      render_views

      it "renders correctly" do
        subject
        
        expect(response).to be_ok
      end
    end
  end
end

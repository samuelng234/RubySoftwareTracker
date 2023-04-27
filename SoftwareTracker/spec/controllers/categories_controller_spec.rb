require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "#index" do
    subject(:subject) { get :index }
    
    context "when the category index is loaded successfully" do
      render_views

      it "renders correctly" do
        subject
        
        expect(response).to be_ok
      end
    end
  end

  describe "#new" do
    subject(:subject) { get :new }
    
    context "when the new category is loaded successfully" do
      render_views

      it "renders correctly" do
        subject
        
        expect(response).to be_ok
      end
    end
  end

  describe "#create" do
    subject(:subject) { post :create, params: { category: { name: "name" } } }
    
    context "when the create category is loaded successfully" do
      render_views

      it "renders correctly" do
        subject
        
        expect(response).to be_ok
      end
    end
  end

  describe "#edit" do
    subject(:subject) { get :edit }
    
    context "when the edit category is loaded successfully" do
      render_views

      it "renders correctly" do
        subject
        
        expect(response).to be_ok
      end
    end
  end

  describe "#show" do
    subject(:subject) { get :show, params: { id: 1 } }
    
    context "when the show category is loaded successfully" do
      render_views

      it "renders correctly" do
        subject
        
        expect(response).to be_ok
      end
    end
  end

  describe "#update" do
    subject(:subject) { post :update }
    
    context "when the update category is loaded successfully" do
      render_views

      it "renders correctly" do
        subject
        
        expect(response).to be_ok
      end
    end
  end

  describe "#destroy" do
    subject(:subject) { delete :destroy }
    
    context "when the destroy category is loaded successfully" do
      render_views

      it "renders correctly" do
        subject
        
        expect(response).to be_ok
      end
    end
  end
end

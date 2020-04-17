require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
    describe "#create" do
        it "Increases created categories by one if the record is valid" do
            category_params = FactoryBot.attributes_for(:category)
            expect { post :create, params: { category: category_params } }.to change(Category.all, :count).by(1)
        end

        it "Does not create a category record if the the record is invalid" do
            expect { post :create, params: { category: {name: ""} } }.to change(Category.all, :count).by(0)
        end
    end 

    describe "Destroy" do
        it "Reduces the number of created categories by one" do
            post :create, params: { category: {name: "Secretarial"} }
            expect { delete :destroy, params: {id: Category.last.id}}.to change(Category.all, :count).by(-1)
        end
        it "Does not delete a record if it does not exist" do
            expect { delete :destroy, params: {id: 8}}.to change(Category.all, :count).by(0)
        end
    end
end
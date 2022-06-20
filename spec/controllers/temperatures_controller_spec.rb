require 'rails_helper'

RSpec.describe TemperaturesController, type: :controller do

    let(:valid_attributes) {
        { warm_bottom_temp: 0, warm_top_temp: 10 }
    }

    let(:valid_session) { {} }

    describe "GET #index" do
        it "returns a success response" do
            Temperature.create! valid_attributes
            get :index, params: {}, session: valid_session
            expect(response).to be_successful # be_successful expects a HTTP Status code of 200
            # expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
        end
    end

    describe "GET #new" do
        it "redirects to edit if temperature record exists" do
            Temperature.create! valid_attributes
            get :new, params: {}, session: valid_session
            expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
        end
    end

end
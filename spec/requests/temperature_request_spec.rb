require 'rails_helper'

RSpec.describe 'Temperatures', type: :request do

  it "renders index page" do
   get temperatures_path
   expect(response).to have_http_status(200)
  end

  it "redirects to root when unsigned user wants to visit new page " do
    get new_temperature_path
    expect(response).to have_http_status(302)
   end

  it "redirects to root when unsigned user wants to visit edit page " do
    temperature = Temperature.create!(warm_bottom_temp: 0, warm_top_temp: 10)
    get edit_temperature_path(temperature)
    expect(response).to have_http_status(302)
  end


end

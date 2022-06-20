require 'rails_helper'

RSpec.describe Temperature, type: :model do
  
  context 'validation tests' do
    
    # it 'ensurance presence of warm_top_temp' do
    #   temperature = Temperature.new(warm_bottom_temp: 10).save
    #   expect(temperature).to eq(false)
    # end

    # it 'ensurance presence of warm_bottom_temp' do
    #   temperature = Temperature.new(warm_top_temp: 10).save
    #   expect(temperature).to eq(false)
    # end

    it 'ensurance the bottom temperature is lower' do
      temperature = Temperature.new(warm_bottom_temp: 10, warm_top_temp: 0).save
      expect(temperature).to eq(false)
    end

    it 'ensurance the bottom temperature is not equal' do
      temperature = Temperature.new(warm_bottom_temp: 10, warm_top_temp: 10).save
      expect(temperature).to eq(false)
    end
  
    it 'saves successfully' do
      temperature = Temperature.new(warm_bottom_temp: 0, warm_top_temp: 10).save
      expect(temperature).to eq(true)
    end


  end

end
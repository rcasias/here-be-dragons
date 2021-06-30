require 'rspec'
require 'pry'
require './lib/nytimes'


RSpec.describe Nytimes do


  it 'test_it_can_get_copyright' do
    @hash = Nytimes::DATA
    # binding.pry
    result = @hash[:copyright]

    expect(result).to eq("Copyright (c) 2018 The New York Times Company. All Rights Reserved.")
  end

  it 'test_it_can_get_array_of_stories' do
    @hash = Nytimes::DATA
    result = @hash[:results]

    expect(result.is_a?(Array)).to eq(true)
    expect(result.count).to eq(44)
  end

  it 'test_it_can_get_all_stories_with_subsection_of_politics' do
    @hash = Nytimes::DATA

    result = @hash[:results].find_all do |result|
      result[:subsection] == "Politics"
    end

    expect(result.is_a?(Array)).to eq(true)
    expect(result.count).to eq(6)
    expect(result.first[:title]).to eq("Congressional G.O.P. Agenda Quietly Falls Into Place Even as Trump Steals the Spotlight")
    expect(result.last[:title]).to eq("Conspiracy Theories Made Alex Jones Very Rich. They May Bring Him Down.")
  end

end

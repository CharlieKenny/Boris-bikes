require 'van'
# require 'bike'

describe Van do


  it 'can pick up bikes' do 
    bike = double :bike
    subject.collect(:bike)
    expect(subject.contents).to eq [:bike]
  end

  it 'can deliver to garages' do
    bike = double :bike, broken?: true
    garage = double :garage, repair_contents: []
    subject.contents = [bike]
    subject.deliver(garage)
    expect(subject.contents).to be_empty
  end
end
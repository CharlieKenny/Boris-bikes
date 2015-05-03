require 'bike'

describe Bike do
  it { is_expected.to respond_to :working }

  it 'new bike should be working' do
    expect(Bike.new).to be_working
  end
end

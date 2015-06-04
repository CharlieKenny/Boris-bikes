require 'docking_station'
  
  describe DockingStation do
    it{is_expected.to respond_to :release_bike}


    it 'releases working bikes' do
      subject.dock(double :bike, broken?: false, working?: true)
      bike = subject.release_bike
      expect(bike.working?).to be true
    end
  
    it{is_expected.to respond_to(:dock).with(1).argument}
    
    describe 'when we release_bike' do 
      it 'raises an error when there are no bikes available' do
        20.times {subject.dock(Bike.new)} 
        20.times {subject.release_bike}
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end

      it 'raises an error when there are only broken bikes available' do 
        bike = double :bike, broken?: true, report_broken: true
        bike.report_broken
        subject.dock(bike)
        expect{subject.release_bike }.to raise_error 'No bikes available'
      end
    end
  
    describe 'dock' do
      it 'raises an error when full' do 
        subject.capacity.times {subject.dock(double :bike)}
        expect { subject.dock(double :bike) }.to raise_error 'Docking station full'
      end
    end

    it 'has a default capacity' do 
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end


end





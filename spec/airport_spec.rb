require 'airport'
require 'plane'

describe Airport do

  let(:weather_is_sunny) { subject.current_forecast.generate_weather(80) }
  let(:weather_is_stormy) { subject.current_forecast.generate_weather(81) }
  let(:landed_plane) { double(:landed_plane, report_take_off: false, landed?: true)}
  let(:inflight_plane) { double(:inflight_plane, report_landed: true, report_take_off: false, landed?: false)}


  describe '#initialize' do
    it "defaults capacity" do
      weather_is_sunny
      described_class::DEFAULT_CAPACITY.times {subject.land_plane(double(:plane, report_landed: true, landed?: false))}
      expect { subject.land_plane(inflight_plane) }.to raise_error "Full airport"
    end
  end

  describe '#land_plane(plane)' do

    it 'lands a plane at an airport and reports plane as landed' do
      weather_is_sunny
      expect(subject.land_plane(inflight_plane)).to eq [inflight_plane]
    end

    it 'prevents landing when weather is stormy' do
      weather_is_stormy
      expect { subject.land_plane(inflight_plane) }.to raise_error "Delay landing!"
    end

    it 'prevents landing when airport is full' do
      weather_is_sunny
      subject.capacity.times { subject.land_plane(double(:plane, report_landed: false, landed?: false)) }
      expect { subject.land_plane(inflight_plane) }.to raise_error "Full airport"
    end

    it 'will not land a plane that is already landed' do
      weather_is_sunny
      expect { subject.land_plane(landed_plane) }.to raise_error "already landed"
    end
  end

  describe '#launch_plane' do
    it 'raises an error if plane is not in airport' do
        weather_is_sunny
        subject.land_plane(inflight_plane)
        plane2 = double(:plane, report_take_off: false, landed?: true)
        expect { subject.launch_plane(plane2) }.to raise_error "Plane not here"
    end

    it 'tells a plane to take off from an airport and reports as departed' do
      weather_is_sunny
      subject.land_plane(inflight_plane)
      expect(subject.launch_plane(inflight_plane)).to eq inflight_plane
    end

    it 'prevents planes taking off when weather is stormy' do
      weather_is_stormy
      expect { subject.launch_plane(landed_plane) }.to raise_error "No flights"
    end

  end
end

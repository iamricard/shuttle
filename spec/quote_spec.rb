require_relative '../lib/quote'

describe Quote do
  before :each do
    @sqrt_of_eight = Math.sqrt(8)
  end

  it 'should return a quote of 1' do
    q = Quote.new [0, 0], [1, 0]
    expect(q.price).to eq(1)
  end

  it 'should return a quote of 2' do
    q = Quote.new [0, 0], [2, 0]
    expect(q.price).to eq(2)
  end

  it 'should return a quote of 4' do
    q = Quote.new [0, 0], [@sqrt_of_eight, @sqrt_of_eight]
    expect(q.price).to eq(4)
  end

  it 'should return a quote of 4 starting at 0 ending at negative' do
    q = Quote.new [0, 0], [-@sqrt_of_eight, -@sqrt_of_eight]
    expect(q.price).to eq(4)
  end

  it 'should return a quote of 4 starting at positive, ending at negative' do
    q = Quote.new [@sqrt_of_eight/2, @sqrt_of_eight/2], [-@sqrt_of_eight/2, -@sqrt_of_eight/2]
    expect(q.price).to eq(4)
  end

  it 'should cost 20% extra when a motorbike is needed' do
    q = Quote.new([@sqrt_of_eight/2, @sqrt_of_eight/2], [-@sqrt_of_eight/2, -@sqrt_of_eight/2], 'mbike')
    expect(q.price).to eq(4 * 1.20)
  end

  it 'should cost 30% extra when a car is needed' do
    q = Quote.new([@sqrt_of_eight/2, @sqrt_of_eight/2], [-@sqrt_of_eight/2, -@sqrt_of_eight/2], 'car')
    expect(q.price).to eq(4 * 1.30)
  end

  it 'should cost 40% extra when a van is needed' do
    q = Quote.new([@sqrt_of_eight/2, @sqrt_of_eight/2], [-@sqrt_of_eight/2, -@sqrt_of_eight/2], 'van')
    expect(q.price).to eq(4 * 1.40)
  end

  it 'should switch to using a car when the distance is more than 100' do
    q = Quote.new [0, 0], [Math.sqrt(5202), Math.sqrt(5202)], 'mbike'
    expect(q.price).to eq(102 * 1.3)
  end

  it 'should switch to using a van when the distance is more than 200' do
    q = Quote.new [0, 0], [Math.sqrt(20402), Math.sqrt(20402)], 'mbike'
    expect(q.price).to eq(202 * 1.4)
  end

  it 'should raise an error when the distance is more than 500' do
    expect{ Quote.new([0, 0], [Math.sqrt(126002), Math.sqrt(126002)], 'mbike') }.to raise_error('Unquotable')
  end
end


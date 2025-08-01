# frozen_string_literal: true

describe Hash do
  subject(:favorites) { { color: 'blue', food: 'fajitas' } }

  # As you discovered in the last assignment, the include matcher works on any
  # object that would respond to the #include? method.
  # https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/include/
  context 'when changing favorite color to forest green' do
    it 'includes green' do
      favorites[:color] = 'forest green'
      expect(favorites[:color]).to include('green')
    end
  end

  context 'when a favorite movie is not in the hash' do
    it 'is nil' do
      expect(favorites[:movie]).to be_nil
    end
  end

  # Use the 'be' matcher when testing for true or false values.
  context 'when testing for true or false values' do
    subject(:car_features) do
      {
        remote_start?: true,
        parking_camera?: true,
        assisted_steering?: false
      }
    end

    it 'has remote start' do
      expect(car_features[:remote_start?]).to be true
    end

    it 'does not have assisted steering' do
      expect(car_features[:assisted_steering?]).to be false
    end
  end
end

# ASSIGNMENT

describe Hash do
  subject(:my_car) do
    {
      make: 'Volkswagen',
      model: 'Jetta',
      year: 2017,
      parking_camera?: true,
      assisted_steering?: false
    }
  end

  # remove the 'x' before running this test
  it 'is newer than 2015' do
    # Write a test that verifies the above statement.
    expect(subject[:year]).to be> 2015
  end

  # remove the 'x' before running this test
 it 'has a parking camera' do
    # Write a test that verifies the above statement.
    expect(subject[:parking_camera?]).to be true
  end

  # remove the 'x' before running this test
  it 'does not have assisted steering' do
    # Write a test that verifies the above statement.
    expect(subject[:assisted_steering?]).to be false
  end
end

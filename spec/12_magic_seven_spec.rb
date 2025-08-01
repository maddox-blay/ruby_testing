# frozen_string_literal: true

require_relative '../lib/12_magic_seven'

# The file order to complete this lesson:
# 1. Familiarize yourself with the class in lib/12_magic_seven.rb
# 2. Complete spec/12_magic_seven_spec.rb

# Before learning any more complexities of testing, let's take a look at a
# standard testing pattern: Arrange, Act, and Assert.
# https://youtu.be/f8gjbPLFnqU

# 1. Arrange -> set up the test (examples: initializing objects, let
#               variables, updating values of instance variables).
# 2. Act ->     execute the logic to test (example: calling a method to run).
# 3. Assert ->  expect the results of arrange & act.

# The tests in this lesson are fairly easy to understand, and it may seem
# ridiculous to use A-A-A for them. However, tests should be easily understood
# not just by you, but also by someone that is not familiar with the code.

# NOTE: When you start using A-A-A to format your tests, it will feel
# strange to not be following DRY (Don't Repeat Yourself). With tests, however,
# repetition is necessary in order for them to be easy to read. If you are using
# rubocop, you can disable specific (or all) cops for certain files (or
# directories) by adding a .rubocop.yml file.
# https://docs.rubocop.org/rubocop/configuration.html#includingexcluding-files

# When you start working on an existing code base, you will often become familiar
# with the code by reading the tests.

describe MagicSeven do
  # This next line should be very familiar, and it is part of the 'Arrange' step.
  subject(:game) { described_class.new }

  describe '#add_nine' do
    # This test could be written as below (and it would pass):
    it 'returns 15' do
      expect(game.add_nine(6)).to eq(15)
    end

    # However, the above test is NOT very readable. For example, it does not
    # explain where '6' came from. So let's start with explaining
    # where '6' came from, as part of the 'Arrange' step.
    it 'returns 15' do
      random_number = 6

      # For the 'Act' step, we will be testing the result of the logic of adding
      # nine to the random_number.
      result = game.add_nine(random_number)

      # For the 'Assert' step, we know exactly what we expect the result to be:
      expect(result).to eq(15)
    end
  end

  # In addition, using a context to explain the conditions of the test makes
  # the output more readable.
  describe '#multiply_by_two' do
    context 'when the previous step is 8' do
      it 'returns 16' do
        previous_step = 8 # Arrange
        result = game.multiply_by_two(previous_step) # Act
        expect(result).to eq(16) # Assert
      end
    end
  end

  # ASSIGNMENT
  # Write a test for each of the following methods:

  describe '#subtract_four' do
    context 'subtract four if the random number is 6' do
      it 'returns two' do
        random_number = 6
        result = game.subtract_four(random_number)
        expect(result).to eq(2)
      end
    end
  end

  describe '#divide_by_two' do
    context 'divide the random number by two' do
      it 'returns three' do
        random_number = 6
        result = game.divide_by_two(random_number)
        expect(result).to eq(3)
      end
    end
  end

  # The following tests will need you to create new instances of MagicSeven with
  # a specific value for the random_number.
  describe '#subtract_random_number' do
    subject(:sub) {described_class.new(12)}
    context 'subtracts 12 from result of previous step' do
      it 'returns seven' do
        previous_step = 19
        result = sub.subtract_random_number(previous_step)
        expect(result).to eq 7
      end
    end
  end

  # The #play method will always return seven! Test this game, using any
  # integer as the random_number. Update the context with the number.
  describe '#play' do
    subject(:magic) {described_class.new(12)}
    context 'when the random number is 12' do
      # remove the 'x' before running this test
      it 'will return 7' do
        expect(magic.play).to eq(7)
      end
    end

    context 'when the random number is 20' do
      subject(:test1) {described_class.new(20)}
      # remove the 'x' before running this test
      it 'will return 7' do
        expect(test1.play).to eq 7
      end
    end

    context 'when the random number is 0' do
      subject(:test2) {described_class.new(0)}
      # remove the 'x' before running this test
      it 'will return 7' do
        expect(test2.play).to eq 7
      end
    end
  end
end

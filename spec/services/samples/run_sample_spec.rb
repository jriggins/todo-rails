require 'rails_helper'

RSpec.describe Samples::RunSample do
  describe '#call' do
    it 'is a success' do
      run_sample = Samples::RunSample.new

      expect(run_sample.call).to eq(::Dry::Monads::Success())
    end
  end
end

# frozen_string_literal: true

module Samples
  class SamplesController < ApplicationController
    def index
      run_sample.bind { |_| render_index }
    end

    private

    def render_index
      respond_to do |format|
        format.json { render json: {status: :ok} }
      end
    end

    def run_sample
      Samples::RunSample.new.call
    end
  end
end

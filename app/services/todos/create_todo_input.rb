# frozen_string_literal: true

module Todos
  class CreateTodoInput
    include ActiveModel::Validations
    attr_reader :title, :description

    validates_presence_of :title

    def initialize(title:, description:)
      @title = title
      @description = description
    end

    # def validate
    #   valid?
    # end

    def self.from_hash(hash:)
      CreateTodoInput.new(
        title: hash[:title],
        description: hash[:description]
      )
    end
  end
end

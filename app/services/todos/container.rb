
module Todos
  class Container
    @@registry = {}

    def self.[](key)
      @@registry[key]
    end

    @@registry['uuid_factory'] = ->() { SecureRandom.uuid }

    @@registry['create_todo'] =
      CreateTodo.new(repository: Todo, uuid_factory: self['uuid_factory'])
  end
end
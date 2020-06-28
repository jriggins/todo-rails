
module Utils
  class GenerateUuid
    def call
      SecureRandom.uuid
    end
  end
end

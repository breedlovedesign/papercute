module BreedloveDesign
  module Papercute
    module Logger
      def log(item, activate = true)
        pp item if activate
      end
    end
  end
end

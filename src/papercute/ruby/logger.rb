# typed: true
module BreedloveDesign
  module Papercute
    module Logger
      include Kernel
      def log(item, activate = true)
        pp item if activate
      end
    end
  end
end

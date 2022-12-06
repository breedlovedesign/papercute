# typed: true
module BreedloveDesign
  module Papercute
    module Logger
      extend T::Sig
      include Kernel
      def log(item, activate = true)
        pp item if activate
      end
    end
  end
end

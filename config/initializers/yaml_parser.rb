# Monkey-patch Psych.load to enable alias parsing by default
module Psych
    class << self
      alias_method :original_load, :load
  
      def load(yaml, *args)
        original_load(yaml, *args, aliases: true)
      end
    end
  end
  
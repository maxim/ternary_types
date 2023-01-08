require 'ternary_types/version'
require 'singleton'

module TernaryTypes
  module Coersion
    module_function

    def Ternary(value)
      case value
      when True, False, Maybe; value
      when nil, false; False.instance
      else; True.instance
      end
    end
  end

  class True
    include Singleton
    include Coersion

    def true?;  true  end
    def maybe?; false end
    def false?; false end
    def to_s; 'true' end

    def !; False.instance end
    def ==(other); other end
    def &(other); other end
    def |(other); self end

    def ^(other)
      case Ternary(other)
      when True then False.instance
      when Maybe then Maybe.instance
      else self
      end
    end
  end

  class Maybe
    include Singleton
    include Coersion

    def true?;  false end
    def maybe?; true  end
    def false?; false end
    def to_s; 'maybe' end

    def !; self end
    def ==(other); self end
    def ^(other); self end

    def &(other)
      case Ternary(other)
      when True then self
      when Maybe then self
      else False.instance
      end
    end

    def |(other)
      case Ternary(other)
      when True then True.instance
      when Maybe then self
      else self
      end
    end
  end

  class False
    include Singleton
    include Coersion

    def true?;  false end
    def maybe?; false end
    def false?; true  end
    def to_s; 'false' end

    def !; True.instance end
    def &(other); self end
    def |(other); other end
    def ^(other); other end

    def ==(other)
      case Ternary(other)
      when True then self
      when Maybe then Maybe.instance
      else True.instance
      end
    end
  end
end

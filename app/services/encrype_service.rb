class EncrypeService
  attr_accessor :encode

  def initialize(str)
    @encode = Digest::SHA1.hexdigest(str.to_s)
  end

  def call
    encode
  end
end

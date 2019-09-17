module Encryptable

  def get_keys(key)
    output_hash = Hash.new
    output_hash[:a_key] = key.slice(0..1)
    output_hash[:b_key] = key.slice(1..2)
    output_hash[:c_key] = key.slice(2..3)
    output_hash[:d_key] = key.slice(3..4)
    output_hash
  end

end

module Encryptable

  def get_keys(key)
    output_hash = Hash.new
    output_hash[:a_key] = key.slice(0..1).to_i
    output_hash[:b_key] = key.slice(1..2).to_i
    output_hash[:c_key] = key.slice(2..3).to_i
    output_hash[:d_key] = key.slice(3..4).to_i
    output_hash
  end

  def get_offsets(date)
    date_squared = (date.to_i ** 2).to_s
    output_hash = Hash.new
    output_hash[:a_offset] = date_squared.slice(-4).to_i
    output_hash[:b_offset] = date_squared.slice(-3).to_i
    output_hash[:c_offset] = date_squared.slice(-2).to_i
    output_hash[:d_offset] = date_squared.slice(-1).to_i
    output_hash
  end
end

module Encryptable

  def get_keys(key)
    output_hash = Hash.new
    output_hash[:a] = key.slice(0..1).to_i
    output_hash[:b] = key.slice(1..2).to_i
    output_hash[:c] = key.slice(2..3).to_i
    output_hash[:d] = key.slice(3..4).to_i
    output_hash
  end

  def get_offsets(date)
    date_squared = (date.to_i ** 2).to_s
    output_hash = Hash.new
    output_hash[:a] = date_squared.slice(-4).to_i
    output_hash[:b] = date_squared.slice(-3).to_i
    output_hash[:c] = date_squared.slice(-2).to_i
    output_hash[:d] = date_squared.slice(-1).to_i
    output_hash
  end

  def get_shifts(key, date)
    get_keys(key).merge!(get_offsets(date)) do |_, key_value, offset_value|
      key_value + offset_value
    end
  end

  def character_set?(char, char_set)
    return true if char_set.include?(char)
    false
  end

  def get_index(char, char_set)
    char_set.index(char)
  end

end

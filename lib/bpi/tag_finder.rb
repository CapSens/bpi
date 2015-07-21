module Bpi

  def get_tag(object, key)
    if bpi_dictionary.has_key?(key) == false
      bpi_default[key]
    elsif object.bpi_dictionary[key].is_a? Hash
      object.send(hash.keys.first).send(hash.keys.first)
    else !object.bpi_dictionary[key].is_a? Hash
      object.send bpi_dictionary[key]
    end
  end

end

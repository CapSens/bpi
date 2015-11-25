module Bpi

  def get_tag(object, key)
    if !bpi_dictionary.has_key?(key) || (bpi_dictionary.has_key?(key) && object.send(bpi_dictionary[key]).nil?)
      bpi_default[key]
    elsif object.bpi_dictionary[key].is_a? Hash
      # {loc: :localisation}
      object.send(bpi_dictionary[key].keys.first).send(bpi_dictionary[key].values.first)
    else
      object.send bpi_dictionary[key]
    end
  end
end

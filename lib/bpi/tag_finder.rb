module Bpi

  # The get_tag method takes two paramters : an object (here, the project), and a tag name.
  # It will search if that tag value is defined in the dictionary of your application, and if not, will
  # take the value you defined manually (see README.md)
  
  def get_tag(object, tag)
		case tag
		when "impact_social"
			if object.try(bpi_dictionary[:impact_social]).nil?
        Rails.application.config.bpi.impact_social
      else
        object.send bpi_dictionary[:impact_social]
      end
		when "impact_environnemental"
      if object.try(bpi_dictionary[:impact_environnemental]).nil?
        Rails.application.config.bpi.impact_environnemental
      else
        object.send bpi_dictionary[:impact_environnemental]
      end
		when "impact_culturel"
			if object.try(bpi_dictionary[:impact_culturel]).nil?
        Rails.application.config.bpi.impact_culturel
      else
        object.send bpi_dictionary[:impact_culturel]
      end
		when "impact_eco"
      if object.try(bpi_dictionary[:impact_eco]).nil?
        Rails.application.config.bpi.impact_eco
      else
        object.send bpi_dictionary[:impact_eco]
      end
		when "categorie1"
			if !object.try(bpi_dictionary[:categorie1]).nil?
				object.send bpi_dictionary[:categorie1]
			elsif Rails.application.config.bpi.categorie1.present?
				Rails.application.config.bpi.categorie1
			end
		when "categorie2"
			if !object.try(bpi_dictionary[:categorie2]).nil?
				object.send bpi_dictionary[:categorie2]
			elsif Rails.application.config.bpi.categorie2.present?
				Rails.application.config.bpi.categorie2
			end
		when "mots_cles_op"
			if !object.try(bpi_dictionary[:mots_cles_op]).nil?
				object.send bpi_dictionary[:mots_cles_op]
			elsif Rails.application.config.bpi.mots_cles_op.present?
				Rails.application.config.bpi.mots_cles_op
			end
		when "mode_financement"
			if object.try(bpi_dictionary[:mode_financement]).nil?
        Rails.application.config.bpi.mode_financement
      else
        object.send bpi_dictionary[:mode_financement]
      end
		when "qualif_ESS"
			if object.try(bpi_dictionary[:qualif_ESS]).nil?
        Rails.application.config.bpi.qualif_ESS
      else
        object.send bpi_dictionary[:qualif_ESS]
      end
		when "ville"
			object.send bpi_dictionary[:ville] unless object.try(bpi_dictionary[:ville]).nil?
		else
			nil
		end
	end

end

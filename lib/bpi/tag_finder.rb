module Bpi

  def get_tag(object, tag)
		case tag
		when "impact_social"
			object.try(bpi_dictionary[:impact_social]).nil? ? Rails.application.config.bpi.impact_social : object.send bpi_dictionary[:impact_social]
		when "impact_environnemental"
			object.try(bpi_dictionary[:impact_environnemental]).nil? ? Rails.application.config.bpi.impact_environnemental : object.send bpi_dictionary[:impact_environnemental]
		when "impact_culturel"
			object.try(bpi_dictionary[:impact_culturel]).nil? ? Rails.application.config.bpi.impact_culturel : object.send bpi_dictionary[:impact_culturel]
		when "impact_eco"
			object.try(bpi_dictionary[:impact_eco]).nil? ? Rails.application.config.bpi.impact_eco : object.send bpi_dictionary[:impact_eco]
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
			object.try(bpi_dictionary[:mode_financement]).nil? ? Rails.application.config.bpi.mode_financement : object.send bpi_dictionary[:mode_financement]
		when "qualif_ESS"
			object.try(bpi_dictionary[:qualif_ESS]).nil? ? Rails.application.config.bpi.qualif_ESS : object.send bpi_dictionary[:qualif_ESS]
		when "ville"
			object.send bpi_dictionary[:ville] unless object.try(bpi_dictionary[:ville]).nil?
		else
			nil
		end
	end

end

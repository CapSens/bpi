module Bpi

  def get_impact(object, impact)
    case impact
    when "impact_social"
			if object.try(bpi_dictionary[:impact_social]).nil?
        Rails.application.config.bpi.impact_social
      elsif object.try(bpi_dictionary[:impact_social]).is_a? Hash
        object.send bpi_dictionary[:impact_social][:impact_social]
      else
        object.send bpi_dictionary[:impact_social]
      end
		when "impact_environnemental"
      if object.try(bpi_dictionary[:impact_environnemental]).nil?
        Rails.application.config.bpi.impact_environnemental
      elsif object.try(bpi_dictionary[:impact_environnemental]).is_a? Hash
        object.send bpi_dictionary[:impact_environnemental][:impact_environnemental]
      else
        object.send bpi_dictionary[:impact_environnemental]
      end
		when "impact_culturel"
			if object.try(bpi_dictionary[:impact_culturel]).nil?
        Rails.application.config.bpi.impact_culturel
      elsif object.try(bpi_dictionary[:impact_culturel]).is_a? Hash
        object.send bpi_dictionary[:impact_culturel][:impact_culturel]
      else
        object.send bpi_dictionary[:impact_culturel]
      end
		when "impact_eco"
      if object.try(bpi_dictionary[:impact_eco]).nil?
        Rails.application.config.bpi.impact_eco
      elsif object.try(bpi_dictionary[:impact_eco]).is_a? Hash
        object.send bpi_dictionary[:impact_eco][:impact_eco]
      else
        object.send bpi_dictionary[:impact_eco]
      end
    else
      nil
    end
  end

  def get_category(object, category)
    case category
    when "categorie1"
  		if !object.try(bpi_dictionary[:categorie1]).nil? && !object.try(bpi_dictionary[:categorie1]).is_a?(Hash)
        object.send bpi_dictionary[:categorie1]
      elsif !object.try(bpi_dictionary[:categorie1]).nil? && object.try(bpi_dictionary[:categorie1]).is_a?(Hash) then
        object.send bpi_dictionary[:categorie1][:categorie1]
  		elsif Rails.application.config.bpi.categorie1.present?
        Rails.application.config.bpi.categorie1
  		end
  	when "categorie2"
      if !object.try(bpi_dictionary[:categorie2]).nil? && !object.try(bpi_dictionary[:categorie2]).is_a?(Hash)
  			object.send bpi_dictionary[:categorie2]
      elsif !object.try(bpi_dictionary[:categorie2]).nil? && object.try(bpi_dictionary[:categorie2]).is_a?(Hash) then
        object.send bpi_dictionary[:categorie2][:categorie2]
  		elsif Rails.application.config.bpi.categorie2.present?
  			Rails.application.config.bpi.categorie2
  		end
    else
      nil
    end
  end

  def get_tag(object, tag)
		case tag
		when "mots_cles_op"
      if !object.try(bpi_dictionary[:mots_cles_op]).nil? && !object.try(bpi_dictionary[:mots_cles_op]).is_a?(Hash)
        object.send bpi_dictionary[:mots_cles_op]
      elsif !object.try(bpi_dictionary[:mots_cles_op]).nil? && object.try(bpi_dictionary[:mots_cles_op]).is_a?(Hash) then
        object.send bpi_dictionary[:mots_cles_op][:mots_cles_op]
      elsif Rails.application.config.bpi.mots_cles_op.present?
        Rails.application.config.bpi.mots_cles_op
      end
		when "mode_financement"
			if object.try(bpi_dictionary[:mode_financement]).nil?
        Rails.application.config.bpi.mode_financement
      elsif object.try(bpi_dictionary[:mode_financement]).is_a? Hash
        object.send bpi_dictionary[:mode_financement][:mode_financement]
      else
        object.send bpi_dictionary[:mode_financement]
      end
		when "qualif_ESS"
      if object.try(bpi_dictionary[:qualif_ESS]).nil?
        Rails.application.config.bpi.qualif_ESS
      elsif object.try(bpi_dictionary[:qualif_ESS]).is_a? Hash
        object.send bpi_dictionary[:qualif_ESS][:qualif_ESS]
      else
        object.send bpi_dictionary[:qualif_ESS]
      end
		when "ville"
      if !object.try(bpi_dictionary[:ville]).nil? && !object.try(bpi_dictionary[:ville]).is_a?(Hash)
			  object.send bpi_dictionary[:ville]
      elsif !object.try(bpi_dictionary[:ville]).nil? && object.try(bpi_dictionary[:ville]).is_a?(Hash) then
        object.send bpi_dictionary[:ville][:ville]
      end
		else
			nil
		end
	end

end

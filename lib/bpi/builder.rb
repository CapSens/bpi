module Bpi

	def bpi_dictionary
		Rails.application.config.bpi.dictionary
	end

	def xml_builder(object)
		builder = Nokogiri::XML::Builder.new do |xml|
		  xml.partenaire {
		    xml.projet {
		    	xml.reference_partenaire Rails.application.config.bpi.reference_partenaire
		    	xml.date_export Rails.application.config.bpi.date_export
		    	xml.reference_projet ''
		    	xml.impact_social Rails.application.config.bpi.impact_social
		    	xml.impact_environnemental Rails.application.config.bpi.impact_environnemental
		    	xml.impact_culturel Rails.application.config.bpi.impact_culturel
		    	xml.impact_eco Rails.application.config.bpi.impact_eco
		  		xml.categorie {
		  			xml.categorie1 Rails.application.config.bpi.categorie1
		  			if Rails.application.config.bpi.categorie2 != ''
		  				xml.categorie2 Rails.application.config.bpi.categorie2
		  			end
		  		}
		  		if Rails.application.config.bpi.mots_cles_nomenclature_operateur != ''
		  			xml.mots_cles_nomenclature_operateur Rails.application.config.bpi.mots_cles_nomenclature_operateur
		  		end
		  		xml.mode_financement Rails.application.config.bpi.mode_financement
		  		xml.type_porteur_projet Rails.application.config.bpi.type_porteur_projet
		  		xml.qualif_ESS Rails.application.config.bpi.qualif_ESS
		  		xml.code_postal bpi_dictionary[:code_postal]
		  		xml.ville object.send bpi_dictionary[:ville]
		  		xml.titre object.send bpi_dictionary[:titre]
		  		xml.description object.send bpi_dictionary[:description]
		  		xml.url ''
		  		xml.url_photo ''
		  		xml.date_debut_collecte object.send bpi_dictionary[:date_debut_collecte]
		  		xml.date_fin_collecte object.send bpi_dictionary[:date_debut_collecte]
		  		xml.montant_recherche object.send bpi_dictionary[:montant_recherche]
		  		xml.montant_collecte object.send bpi_dictionary[:montant_collecte]
				}
		  }
		end
	end
end
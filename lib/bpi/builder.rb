module Bpi
	def xml_builder
		builder = Nokogiri::XML::Builder.new do |xml|
		  xml.partenaire {
		    xml.projet {
		    	xml.reference_partenaire "test"
		    	xml.date_export "test"
		    	xml.reference_projet "test"
		    	xml.impact_social "test"
		    	xml.impact_culturel "test"
		    	xml.impact_eco "test"
		  		xml.categorie {
		  			xml.categorie1 "test"
		  			xml.categorie2 "test"
		  		}
		  		xml.mots_cles_nomenclature_operateur "test"
		  		xml.mode_financement "test"
		  		xml.type_porteur_projet "test"
		  		xml.qualif_ESS "test"
		  		xml.code_postal "test"
		  		xml.ville "test"
		  		xml.titre "test"
		  		xml.description "test"
		  		xml.url "test"
		  		xml.url_photo "test"
		  		xml.date_debut_collecte "test"
		  		xml.date_fin_collecte "test"
		  		xml.montant_recherche "test"
		  		xml.montant_collecte "test"
				}
		  }
		end
	end
	module_function :xml_builder
end
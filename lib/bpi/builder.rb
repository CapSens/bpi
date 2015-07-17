module Bpi

	def bpi_dictionary
		Rails.application.config.bpi.dictionary
	end

	# data must be hash {url: 'https://toto.com/projet/', photo: 'https://toto.com/media/12'}

	# XML Builder for ALL projects
	def xml_builder(objects, xml_stream)
		builder = Nokogiri::XML::Builder.new do |xml|
		  xml.partenaire {
				objects.map do |object|
					data = object.to_bpi_data
					if xml_stream == "history" && object.try(bpi_dictionary[:accept?]) == true
			    	xml.projet {
			    		xml.reference_partenaire Rails.application.config.bpi.reference_partenaire
							xml.lol "TEST"
			    		xml.date_export Time.now.strftime("%Y-%m-%d")
			    		xml.reference_projet object.send bpi_dictionary[:reference_projet]
							xml.impact_social get_tag(object, "impact_social")
							xml.impact_environnemental get_tag(object, "impact_environnemental")
							xml.impact_culturel get_tag(object, "impact_culturel")
							xml.impact_eco get_tag(object, "impact_eco")
							if !get_tag(object, "categorie1").nil?
			  				xml.categorie {
									xml.categorie1 get_tag(object, "categorie1")
									xml.categorie2 get_tag(object, "categorie2") unless get_tag(object, "categorie2").nil?
			  				}
							end
							xml.mots_cles_nomenclature_operateur get_tag(object, "mots_cles_op") unless get_tag(object, "mots_cles_op").nil?
							xml.mode_financement get_tag(object, "mode_financement")
							xml.qualif_ESS get_tag(object, "qualif_ESS")
							xml.code_postal object.send bpi_dictionary[:code_postal]
			  			xml.ville get_tag(object, "ville") unless get_tag(object, "ville").nil?
			  			xml.titre object.send bpi_dictionary[:titre]
			  			xml.description object.send bpi_dictionary[:description]
			  			xml.url data[:url]
			  			xml.url_photo data[:photo]
			  			fullstart = object.send bpi_dictionary[:date_debut_collecte]
			  			xml.date_debut_collecte fullstart.strftime("%F")
			  			fullend = object.send bpi_dictionary[:date_fin_collecte]
			  			if fullend.to_s != ''
			  				xml.date_fin_collecte fullend.strftime("%F")
			  			end
			  			xml.montant_recherche object.send bpi_dictionary[:montant_recherche]
			  			xml.montant_collecte object.send bpi_dictionary[:montant_collecte]
						}
					elsif xml_stream == "current" && object.try(bpi_dictionary[:time_ended?]) == false
						xml.projet {
				    	xml.reference_partenaire Rails.application.config.bpi.reference_partenaire
				    	xml.date_export Time.now.strftime("%Y-%m-%d")
				    	xml.reference_projet object.send bpi_dictionary[:reference_projet]
							xml.impact_social get_tag(object, "impact_social")
							xml.impact_environnemental get_tag(object, "impact_environnemental")
							xml.impact_culturel get_tag(object, "impact_culturel")
							xml.impact_eco get_tag(object, "impact_eco")
							if !get_tag(object, "categorie1").nil?
				  			xml.categorie {
									xml.categorie1 get_tag(object, "categorie1")
									xml.categorie2 get_tag(object, "categorie2") unless get_tag(object, "categorie2").nil?
				  			}
							end
							xml.mots_cles_nomenclature_operateur get_tag(object, "mots_cles_op") unless get_tag(object, "mots_cles_op").nil?
							xml.mode_financement get_tag(object, "mode_financement")
							xml.qualif_ESS get_tag(object, "qualif_ESS")
							xml.code_postal object.send bpi_dictionary[:code_postal]
				  		xml.ville get_tag(object, "ville") unless get_tag(object, "ville").nil?
				  		xml.titre object.send bpi_dictionary[:titre]
				  		xml.description object.send bpi_dictionary[:description]
				  		xml.url data[:url]
				  		xml.url_photo data[:photo]
				  		fullstart = object.send bpi_dictionary[:date_debut_collecte]
				  		xml.date_debut_collecte fullstart.strftime("%F")
				  		fullend = object.send bpi_dictionary[:date_fin_collecte]
				  		if fullend.to_s != ''
				  			xml.date_fin_collecte fullend.strftime("%F")
				  		end
				  		xml.montant_recherche object.send bpi_dictionary[:montant_recherche]
				  		xml.montant_collecte object.send bpi_dictionary[:montant_collecte]
						}
					end
				end
		  }
		end
	end
end

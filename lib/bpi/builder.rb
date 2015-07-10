module Bpi

	def bpi_dictionary
		Rails.application.config.bpi.dictionary
	end

	# data must be hash {url: 'https://toto.com/projet/', photo: 'https://toto.com/media/12'}

	# XML Builder for ALL projects
	def xml_history_builder(objects)
		builder = Nokogiri::XML::Builder.new do |xml|
		  xml.partenaire {
				objects.map do |object|
					data = object.to_bpi_data
			    xml.projet {
			    	xml.reference_partenaire Rails.application.config.bpi.reference_partenaire
			    	xml.date_export Time.now.strftime("%Y-%m-%d")
			    	xml.reference_projet object.send bpi_dictionary[:reference_projet]

						# If the impact_social attribute does not exists in the dictionary,
						# uses the value you defined manually. Note that two different projects
						# may have different impacts. It is then preferable for this attribute and
						# all the other mandatory ones to be present in the dictionary

						impact_social = object.send bpi_dictionary[:impact_social] rescue nil
						if impact_social
							xml.impact_social impact_social
						else
							xml.impact_social Rails.application.config.bpi.impact_social
						end

						impact_environnemental = object.send bpi_dictionary[:impact_environnemental] rescue nil
						if impact_environnemental
							xml.impact_environnemental impact_environnemental
						else
							xml.impact_environnemental Rails.application.config.bpi.impact_environnemental
						end

						impact_culturel = object.send bpi_dictionary[:impact_culturel] rescue nil
						if impact_culturel
							xml.impact_culturel impact_culturel
						else
							xml.impact_culturel Rails.application.config.bpi.impact_culturel
						end

						impact_eco = object.send bpi_dictionary[:impact_eco] rescue nil
						if impact_eco
							xml.impact_eco impact_eco
						else
							xml.impact_eco Rails.application.config.bpi.impact_eco
						end

						categorie1 = object.send bpi_dictionary[:categorie1] rescue nil
						categorie2 = object.send bpi_dictionary[:categorie2] rescue nil
						if categorie1 || Rails.application.config.bpi.categorie1.present?
			  			xml.categorie {
								if categorie1
			  					xml.categorie1 categorie1
								else
									xml.categorie1 Rails.application.config.bpi.categorie1
								end

								if categorie2
									xml.categorie2 categorie2
			  				elsif Rails.application.config.bpi.categorie2.present?
			  					xml.categorie2 Rails.application.config.bpi.categorie2
			  				end
			  			}
						end

						mots_cles_op = object.send bpi_dictionary[:mots_cles_op] rescue nil
						if mots_cles_op
							xml.mots_cles_nomenclature_operateur mots_cles_op
			  		elsif Rails.application.config.bpi.mots_cles_nomenclature_operateur.present?
			  			xml.mots_cles_nomenclature_operateur Rails.application.config.bpi.mots_cles_nomenclature_operateur
			  		end

						mode_financement = object.send bpi_dictionary[:mode_financement] rescue nil
						if mode_financement
			  			xml.mode_financement mode_financement
						else
			  			xml.mode_financement Rails.application.config.bpi.mode_financement
						end

						qualif_ESS = object.send bpi_dictionary[:mode_financement] rescue nil
						if qualif_ESS
			  			xml.qualif_ESS qualif_ESS
						else
							xml.qualif_ESS Rails.application.config.bpi.qualif_ESS
						end

			  		xml.code_postal object.send bpi_dictionary[:code_postal]
			  		villexml = xml.ville object.send bpi_dictionary[:ville]
			  		if villexml.to_s != ''
			  			xml.ville object.send bpi_dictionary[:ville]
			  		end

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
		  }
		end
	end

	# XML Builder for ongoing projects
	def xml_current_builder(objects)
		builder = Nokogiri::XML::Builder.new do |xml|
		  xml.partenaire {
				objects.map do |object|
					data = object.to_bpi_data
					ended = object.send bpi_dictionary[:time_ended?]
					if !ended
			    	xml.projet {
			    		xml.reference_partenaire Rails.application.config.bpi.reference_partenaire
			    		xml.date_export Rails.application.config.bpi.date_export
			    		xml.reference_projet object.send bpi_dictionary[:reference_projet]
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
			  			xml.code_postal object.send bpi_dictionary[:code_postal]
			  			xml.ville object.send bpi_dictionary[:ville]
			  			xml.titre object.send bpi_dictionary[:titre]
			  			xml.description object.send bpi_dictionary[:description]
			  			xml.url data[:url]
			  			xml.url_photo data[:photo]
			  			xml.date_debut_collecte object.send bpi_dictionary[:date_debut_collecte]
			  			xml.date_fin_collecte object.send bpi_dictionary[:date_fin_collecte]
			  			xml.montant_recherche object.send bpi_dictionary[:montant_recherche]
			  			xml.montant_collecte object.send bpi_dictionary[:montant_collecte]
						}
					end
				end
		  }
		end
	end
end

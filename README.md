# BPI XML Exporter

This is the XML export gem for the "Tous nos Projets" website.

In order for it to be functional, you have to set up a dictionary, named **config.bpi.dictionary**
in the **config/application.rb** of your website..because each attribute's name may be
different between two or more given projects. You also have to set specific variables, like
your "reference partenaire" of the "categories", because each of them changes in each project.

For instance, the Fundovino website uses the following dictionary and variables for the gem :

```ruby

# unique partner reference
config.bpi.reference_partenaire = '026'

config.bpi.dictionary = {
    reference_projet: :id,
    titre: :title_fr,
    ville: :localisation,
    description: :presentation,
    date_debut_collecte: :created_at,
    date_fin_collecte: :end_date,
    montant_recherche: :amount,
    montant_collecte: :collected_amount,
    code_postal: :zip_code,
    time_ended?: :time_ended?,
}
```
Below is the list of needed project attributes in order for the XML to be accepted.

### Outside of the dictionary

* config.bpi.reference_partenaire = 'Your unique partenaire reference (string)'
* config.bpi.impact_social = 'NON' or 'OUI'
* config.bpi.impact_environnemental = 'NON' or 'OUI'
* config.bpi.impact_culturel = 'NON' or 'OUI'
* config.bpi.impact_eco = 'NON' or 'OUI'
* config.bpi.categorie1 = '22' (example)
* config.bpi.categorie2 = '41' (example)
* config.bpi.mots_cles_nomenclature_operateur = '' (optional)
* config.bpi.mode_financement = 'DOC' (example)
* config.bpi.type_porteur_projet = 'PAR' (example)
* config.bpi.qualif_ESS = 'NON' or 'OUI'

## dictionary

config.bpi.dictionary = {
    reference_projet: :id,
    titre: :namefortitle,
    ville: :nameforcity,
    description: :namefordescription,
    date_debut_collecte: :created_at,
    date_fin_collecte: :nameforenddate,
    montant_recherche: :nameforwantedamount,
    montant_collecte: :nameforcollectedamount,
    code_postal: :nameforzipcode,
    time_ended?: :time_ended? (your method to see if the project has ended),
}

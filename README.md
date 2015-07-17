# Bpi XML Builder

This gem generates an XML file of your website's projects for tousnosprojets.bpifrance.fr
Two streams are available :
- History (yourwebsite.com/bpi/xml/historique) : Downloads a file containing all projects.
- Current (yourwebsite.com/bpi/xml/current) : Downloads a file containing all ongoing projects.

## Installation

In your **Gemfile**

```
  gem 'bpi', git: "git@projects.capsens.eu:rails-plugins/bpi.git"
```

In **app/controllers/home_controller.rb** :

```ruby
include Bpi
.
.
.
def history
  @projects = xml_history_builder(YourProjectModel.all)
  send_data @projects.to_xml,
    :type => "text/xml; charset=UTF-8;",
    :disposition => "attachement; filename=#{Rails.application.config.bpi.reference_partenaire}_historique.xml"
end

def current
  @projects = xml_current_builder(YourProjectModel.all)
  send_data @projects.to_xml,
    :type => "text/xml; charset=UTF-8;",
    :disposition => "attachement; filename=#{Rails.application.config.bpi.reference_partenaire}.xml"
end
```

In **app/models/project.rb**

You have to set the get_project_data method, which will contain a hash with the url an cover photo url of your project.
The two keys **must** be called **url** and **photo**.

For instance, Fundovino has the following paths.

```ruby
def get_project_data
  {
    url: "https://fundovino.com/fr/#{ id }-#{ to_s.parameterize }",
    photo: "https://fundovino.com#{get_image_projects_path id: id, attribute: 'project_id'}"
  }
end
```

In **config/routes.rb** :

```ruby
get 'bpi/xml/historique' => 'home#history'
get 'bpi/xml/current' => 'home#current'
```

In **config/application.rb** :

```ruby
config.bpi.reference_partenaire = 'your reference partenaire'
```
If you don't know the partner reference for your website, send a mail to sebastien.ramos@smile.fr

You also have to set a dictionary, because each attribute's name may be different between two given projects. Some are mandatory,
some are optinal. Here is the list :

* reference_projet : the id of your project
* impact_social : OUI / NON
* impact_environnemental : OUI / NON
* impact_culturel : OUI / NON
* impact_eco : OUI / NON
Note that your project cannot have more than two impacts, but must have a least one.
* categorie1 (optional)
* categorie2 (optional)
* mots_cles_nomenclature_operateur (optional) : key words
* mode_financement (mandatory) : DON, DOC, PRE, PRR, ACT, OBL
DON => Don sans contrepartie
DOC => Don avec contrepartie
PRE => Prêt non rémunéré
PRR => Prêt rémunéré
ACT => Actions
OBL => Obligations

* type_porteur_projet (mandatory) : ENT, ASS, PAR, COL
ENT => Entreprise
ASS => Association
PAR => Particulier
COL => Collectivités locales
* qualif_ESS (mandatory) : OUI / NON
* code_postal (mandatory)
* ville (optional)
* titre (mandatory)
* description (mandatory)
* url (mandatory)
* url_photo (mandatory)
* date_debut_collecte (mandatory) : YYYY-MM-DD
* date_fin_collecte (mandatory) : YYYY-MM-DD
* montant_recherche (mandatory)
* montant_collecte (mandatory)
* time_ended? : your method that checks if the project has ended
* accept? : your method that checks if the project has been accepted

For instance, Fundovino uses the dictionary below

```ruby
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
  accept?: :accept?
}
```

If one of the attributes is not present in your database (and thus cannot put it in the dictionary) like above,
you can set it manually like this :

```ruby
.
.
config.bpi.impact_social = 'NON'
config.bpi.impact_environnemental = 'OUI'
config.bpi.impact_culturel = 'NON'
config.bpi.impact_eco = 'OUI'
.
.
```

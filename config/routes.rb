Rails.application.routes.draw do
  get 'bpi/xml/historique' => 'bpi_xml#history'
  get 'bpi/xml/current' => 'bpi_xml#current'
end

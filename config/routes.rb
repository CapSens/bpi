Rails.application.routes.draw do
  get 'bpi/xml/historique' => 'bpi_xml#history'
  get 'bpi/xml/export' => 'bpi_xml#export'
end

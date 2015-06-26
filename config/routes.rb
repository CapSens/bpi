Rails.application.routes.draw do
  get 'bpi_xml_export' => 'bpi_xml#export', as: :bpi_xml_export
end

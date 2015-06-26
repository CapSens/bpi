class BpiXmlController < ApplicationController
  include Bpi
  def history
    @projects = xml_history_builder(Project.all)
    send_data @projects.to_xml,
      :type => "text/xml; charset=UTF-8;",
      :disposition => "attachement; filename=#{Rails.application.config.bpi.reference_partenaire}_historique.xml"
  end

  def current
    @projects = xml_current_builder(Project.all)
    send_data @projects.to_xml,
      :type => "text/xml; charset=UTF-8;",
      :disposition => "attachement; filename=#{Rails.application.config.bpi.reference_partenaire}.xml"
  end
end
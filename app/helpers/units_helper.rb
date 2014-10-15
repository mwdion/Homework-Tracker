module UnitsHelper
  def units_loop_by_location
    x= ""
    @location.units.each do |unit|
     x+=(link_to "#{unit.name}, #{unit.date}", location_unit_path(@location, unit)) +
      if can? :update, @unit
        (link_to "Edit", edit_location_unit_path(@location, unit), class: 'btn btn-xs btn-warning')+
      if can? :destroy, @unit
        (link_to "Delete", location_unit_path(@location, unit), method: :delete, class: 'btn btn-xs btn-danger')+
        content_tag(:br)
      end
      end
    end
    x.html_safe
  end
end
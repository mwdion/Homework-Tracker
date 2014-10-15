module LocationsHelper
  def location_list
    @locations.each do |location|
       link_to "#{location.location_name}", location_path(location)
      if can? :update, @location
        link_to "Edit", edit_location_path(location), class: 'btn btn-xs btn-warning'
      end
      if can? :destroy, @location
        link_to "Delete", location_path(location), method: :delete, class: 'btn btn-xs btn-danger'
      end
    end
  end
end

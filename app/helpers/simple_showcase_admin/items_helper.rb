module SimpleShowcaseAdmin
  module ItemsHelper
    def new_child_fields_template(form_builder)
      content_tag(:div, :id => "photos_fields_template", :style => "display: none") do
        form_builder.fields_for(:photos, Photo.new, :child_index => "new_photos") do |f|
          render(:partial => 'photos', :locals => { :f => f })
        end
      end
    end

    def add_child_link(name, association)
      link_to(name, "javascript:void(0)", :class => "add_child btn btn-mini", :"data-association" => association)
    end
  end
end

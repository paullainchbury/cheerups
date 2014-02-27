module CheerupsHelper
  def toggle_flag_button(cheerup, user)
    if user
      if user.flagged?(cheerup, :inappropriate)
        #user has already flagged the cheerup
        link_to "Unflag", flag_cheerup_path(cheerup)
      else
        #user hasn't flagged the cheerup yet
        link_to "Flag", flag_cheerup_path(cheerup)
      end
    end
  end

  
def image_preview(f)
      url, style =  f.object.image.present? ?  [f.object.image.url(:thumb), ''] : ['#','display:none;']
      content_tag(:div, nil) do
        concat image_tag url , {id: 'img_prev', style: style}
        concat ''.html_safe
        concat  f.button 'Remove', {type: 'button', class: 'remove_image', style:'display:none;'}
      end
  end


end

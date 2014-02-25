module CheerupsHelper
  def toggle_flag_button(cheerup, user)
    if user.flagged?(cheerup, :inappropriate)
      #user has already flagged the cheerup
      link_to "Unflag", flag_cheerup_path(cheerup)
    else
      #user hasn't flagged the cheerup yet
      link_to "Flag", flag_cheerup_path(cheerup)
    end
  end


end

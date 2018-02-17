module ApplicationHelper
  def display_user(user)
    image_tag user.image ,:class => 'img-circle' , height: '30', width: '30' , :title => user.name
  end
  
  def display_team(team)
    if(team.nil?)
      '<i class="fa fa-flag-checkered fa-2x" aria-hidden="true"></i>'.html_safe
    else
      flag_icon(team.code.downcase, class: "flag img-rounded", title: team.name, data_toggle: "tooltip" )
    end    
  end
  
  def display_match_result(match)
    if match.result.nil?
      '<i class="fa fa-question fa-2x" aria-hidden="true"></i>'.html_safe
    else
      if match.result == 0
        '<i class="fa fa-adjust fa-2x" aria-hidden="true"></i>'.html_safe
      else
        if match.result < 0
          display_team(match.left)
        else
          display_team(match.right)
        end
      end  
    end
    
  end
end

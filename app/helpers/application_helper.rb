module ApplicationHelper
    
  def display_user(user)
    image_tag user.image ,:class => 'img-circle' , height: '30', width: '30' , :title => user.name
  end
  
  def display_user_nav(user_id)
    if !user_id.nil?
      user = User.find_by_id(user_id)
      if !user.nil?
        image_tag(user.image ,:class => 'img-rounded', height: '20', width: '20' , :title => user.name) + "&nbsp;#{user.name}".html_safe
      end  
    end                                       
  end
  
  def admin?(user_id)
    if !user_id.nil?
      user = User.find_by_id(user_id)
      if user.nil?
        return false
      else
        return user.admin?
      end
    end
  end
  
  def display_team(team)
    if(team.nil?)
      '<i class="fa fa-flag-checkered fa-2x" aria-hidden="true" title="?", data_toggle="tooltip"></i>'.html_safe
    else
      flag_icon(team.code.downcase, class: "flag img-rounded", title: team.name, data_toggle: "tooltip" )
    end    
  end
  
  def display_match(match)
    display_team(match.left) + " <span data-toggle='tooltip' title='Start on #{match.start}'><strong>vs</strong></span> ".html_safe + display_team(match.right)
  end
  
  def display_bet(bet)    
    if bet.bet == 0
      '<i class="fa fa-balance-scale fa-2x" aria-hidden="true"></i>'.html_safe
    else
      if bet.bet < 0
        display_team(bet.match.left)
      else
        display_team(bet.match.right)
      end
    end         
  end
  
  def display_match_result(match)
    if match.result.nil?
      '<i class="fa fa-question fa-2x" aria-hidden="true"></i>'.html_safe
    else
      if match.result == 0
        '<i class="fa fa-balance-scale fa-2x" aria-hidden="true"></i>'.html_safe
      else
        if match.result < 0
          display_team(match.left)
        else
          display_team(match.right)
        end
      end  
    end   
  end
  
  def display_match_lock(match)
    if match.lock?
      '<i class="fa fa-lock fa-2x" aria-hidden="true"></i>'.html_safe
    else
      '<i class="fa fa-unlock fa-2x" aria-hidden="true"></i>'.html_safe
    end
  end
  
end

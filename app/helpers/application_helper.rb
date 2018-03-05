module ApplicationHelper
  def display_user(user)
    image_tag user.image ,:class => 'img-circle' , height: '30', width: '30' , :title => user.name
  end

  def display_user_info(user)
    image_tag user.image ,:class => 'img-circle' , height: '60', width: '60' , :title => user.name
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
      if(team.club?)
        "<span class='badge-25 #{team.code}' title='#{team.name}' data_toggle='tooltip' ></span>".html_safe
      else
        flag_icon(team.code.downcase, class: "flag img-rounded", title: team.name, data_toggle: "tooltip" )
      end
    end
  end

  def display_match(match)
    if match.result.nil?
      display_team(match.left) + " <strong>vs</strong> ".html_safe + display_team(match.right)
    else
      display_team(match.left) + " <strong>#{match.left_score}-#{match.right_score}</strong> ".html_safe + display_team(match.right)
    end    
  end

  def display_bet(bet)
    if bet.nil?
      '<i class="fa fa-question fa-1x text-secondary" aria-hidden="true"></i>'.html_safe
    else
      if bet.bet == 0
        '<i class="fa fa-balance-scale fa-1x" aria-hidden="true"></i>'.html_safe
      else
        if bet.bet < 0
          display_team(bet.match.left)
        else
          display_team(bet.match.right)
        end
      end
    end
  end

  def display_bet_result(bet)
    if bet.nil?
      '<i class="fa fa-hourglass-half fa-1x" aria-hidden="true"></i>'.html_safe
    else
      if bet.match.result.nil?
        '<i class="fa fa-hourglass-half fa-1x" aria-hidden="true"></i>'.html_safe
      else
        if bet.win?
          '<i class="fa fa-check fa-1x text-success" aria-hidden="true"></i>'.html_safe
        else
          '<i class="fa fa-close fa-1x text-danger" aria-hidden="true"></i>'.html_safe
        end
      end
    end
  end

  def display_match_result(match)
    if match.result.nil?
      '<i class="fa fa-hourglass-half fa-1x" aria-hidden="true"></i>'.html_safe
    else
      if match.result == 0
        '<i class="fa fa-balance-scale fa-1x" aria-hidden="true"></i>'.html_safe
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
  
  def display_match_modal(match)
    if match.knockout?
      link_to match.title, {controller: "matches", action: "show", id: match, lightbox: 'true'}, "data-toggle"=>"lightbox", "data-title"=>"#{match.title} #{match.description}", "data-type"=>"url"
    else
      link_to "#{match.description} #{match.title}", {controller: "matches", action: "show", id: match, lightbox: 'true'}, "data-toggle"=>"lightbox", "data-title"=>"#{match.title} #{match.description}", "data-type"=>"url"
    end  
  end
  
  def display_bet_button(index, match)
    link_to "Bet", new_bet_path(:match_id=>match.id, :lightbox=>'true'), :id => "bet-#{index}", :countdown=>match.start, "data-toggle"=>"lightbox", "data-type"=>"url", :class=>'btn-sm'
  end
end

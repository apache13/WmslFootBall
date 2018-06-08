module ApplicationHelper
  def display_user(user)
    text = image_tag(user.image, :class => 'img-circle', height: '30', width: '30', :title => user.name)
    path = {controller: "users", action: "show", id: user, modal: 'true'}
    title = user.name
    display_modal_button(text, path, title)   
  end

  def display_user_info(user)
    image_tag(user.image, :class => 'img-circle', height: '60', width: '60', :title => user.name)
  end

  def display_user_nav(user_id)
    if !user_id.nil?
      user = User.find_by_id(user_id)
      if !user.nil?
        image_tag(user.image ,:class => 'img-circle', height: '20', width: '20' , :title => user.name) + "&nbsp;#{user.name}".html_safe
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
  
  def display_flag(team)        
    if(team.nil?)
      image_tag('flag.jpg' ,:class => 'img-rounded', height: '25', :title => '???')      
    else
      if(team.club?)
        "<span class='badge-25 #{team.code}' title='#{team.name}' data_toggle='tooltip' ></span>".html_safe
      else               
        flag_icon(team.code.downcase, class: "flag img-rounded", title: team.name, data_toggle: "tooltip")                
      end
    end
  end
  
  def display_team(team)        
    if(team.nil?)
      image_tag('flag.jpg' ,:class => 'img-rounded', height: '25', :title => '???')      
    else
      if(team.club?)
        "<span class='badge-25 #{team.code}' title='#{team.name}' data_toggle='tooltip' ></span>".html_safe
      else               
        text = flag_icon(team.code.downcase, class: "flag img-rounded", title: team.name, data_toggle: "tooltip")
        path = {controller: "teams", action: "show", id: team, modal: 'true'}
        title = team.name
        display_modal_button(text, path, title)        
      end
    end
  end

  def display_your_bet(bet)    
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

  def display_your_score(bet)
    if bet.nil?
      '<i class="fa fa-question fa-1x text-secondary" aria-hidden="true"></i>'.html_safe
    else
      if bet.match.result.nil?
        '<i class="fa fa-question fa-1x text-secondary" aria-hidden="true"></i>'.html_safe
      else
        text = bet.pts
        path = {controller: "bets", action: "show", id: bet, modal: 'true'}
        title =  "#{display_match_versus(bet.match)} #{bet.match.title} #{bet.match.description}"       
        display_modal_button(text, path, title)
      end
    end
  end

  def display_match_versus(match)
    if match.result.nil?
      "<ul class='flag-horizontal' style='padding-left: 5px;'><li>#{display_team(match.left)}</li><li><strong>vs</strong></li><li>#{display_team(match.right)}</li></ul>".html_safe
    else
      "<ul class='flag-horizontal' style='padding-left: 5px;'><li>#{display_team(match.left)}</li><li><strong>#{match.left_score}-#{match.right_score}</strong></li><li>#{display_team(match.right)}</li></ul>".html_safe      
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
    
  def display_match_description(match)    
      if match.knockout?
        text = match.title
      else
        text = "#{match.description} #{match.title}"
      end      
      path = {controller: "matches", action: "show", id: match, modal: 'true'}
      title = "#{match.title} #{match.description}"      
      display_modal_button(text, path, title)       
  end
  
  def display_bet_button(index, match)    
    text = "Bet"
    path = user_bet_path(:match_id=>match.id)
    title = "#{display_match_versus(match)} #{match.title} #{match.description}"
    id = "bet-#{index}"
    time = match.start    
    display_modal_button_countdown(text, path, title, id, time)            
  end
  
  def display_champion_button(user)        
    text = "Change"
    path = user_champion_path(user)
    title = "Champion"
    id = "user_bet_champion"
    end_time = DateTime.parse(Config.find_by_key('USER_BET_CHAMPION_END_TIME').value)
    display_modal_button_countdown(text, path, title, id, end_time)            
  end
  
  def display_top_goal_scorer_button(user)        
    text = "Change"
    path = user_top_goal_scorer_path(user)
    title = "Top goal scorer"
    id = "user_bet_top_goal_scorer"
    end_time = DateTime.parse(Config.find_by_key('USER_BET_TOP_GOAL_SCORER_END_TIME').value)
    display_modal_button_countdown(text, path, title, id, end_time)            
  end
  
  private  
  def display_modal_button(text, path, title)
    link_to text, path, "data-lightbox"=>SecureRandom.hex, "data-toggle"=>"lightbox", "data-title"=>title, "data-type"=>"url"
  end
  
  def display_modal_button_countdown(text, path, title, id, end_time)
    link_to text, path, "data-lightbox"=>SecureRandom.hex, "data-toggle"=>"lightbox", "data-title"=>title, "data-type"=>"url", :id=>id, :countdown=>end_time, :class=>'btn-sm'
  end
  
  
end

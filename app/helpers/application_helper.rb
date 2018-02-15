module ApplicationHelper
  def display_user(user)
    image_tag user.image ,:class => 'img-circle' , height: '30', width: '30' , :title => user.name
  end
  
  def display_team(team)
    if(team.nil?)
      image_tag '/winner-flag.png' ,:class => 'flag img-rounded' , height: '20', width: '25'
    else
      flag_icon(team.code.downcase, class: "flag img-rounded")
    end    
  end
  
  def display_match_result(match)
    if match.result.nil?
      image_tag '/winner-flag.png' ,:class => 'flag img-rounded' , height: '20', width: '25'
    else
      if match.result == 0
        image_tag '/winner-flag.png' ,:class => 'flag img-rounded' , height: '20', width: '25'
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

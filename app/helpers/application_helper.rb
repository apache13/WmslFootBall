module ApplicationHelper
  def user_image_tag(user)
    image_tag user.image ,:class => 'img-circle' , height: '30', width: '30' , :title => user.name
  end
  
  def flag_image_tag(team)
    if(team.nil?)
      image_tag '/winner-flag.png' ,:class => 'flag img-rounded' , height: '20', width: '25'
    else
      flag_icon(team.code.downcase, class: "flag img-rounded")
    end    
  end
  
end

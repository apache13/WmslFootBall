module ApplicationHelper
  def user_image_tag(user)
    image_tag user.image ,:class => 'img-circle' , height: '30', width: '30' , :title => user.name
  end
  
  def flag_image_tag(code)
    flag_icon(code.downcase, class: "flag img-rounded")
  end
  
end

module ApplicationHelper
  def facebook_image_tag(user)
    if(!user.nil?)
      link_to user do
        image_tag 'https://graph.facebook.com/'+user.uid+'/picture' ,:class => 'img-circle' , height: '30', width: '30' , :title => user.name
      end
    end
  end
  
  def flag_image_tag(code)
    flag_icon(code.downcase, class: "flag img-rounded")
  end
end

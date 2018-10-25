module TodoListHelper
  def define_image
    if resource.avatar.attached? 
      image_tag(resource.avatar.variant(resize: "150x150"))
    elsif resource.image
      image_tag(resource.image) 
    else
      value_without_image = '<h3> Sin imagen </h3>'.html_safe
    end
  end
end

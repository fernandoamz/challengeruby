module TodoListHelper
    def define_image
        if resource.avatar.file? 
            image_tag(resource.avatar.url(:thumb)) 
        elsif resource.image
            image_tag(resource.image) 
        else
            value_without_image = '<h3> Sin imagen </h3>'.html_safe
        end
    end
end

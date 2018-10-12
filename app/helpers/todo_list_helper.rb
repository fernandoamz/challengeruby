module TodoListHelper
    def defineImage
        if resource.avatar.file? 
            image_tag(resource.avatar.url(:thumb)) 
        elsif resource.image
            image_tag(resource.image) 
        else
            value_without_image = "<h3> Sin imagen </h3>"
            value_without_image.html_safe
        end
    end
end

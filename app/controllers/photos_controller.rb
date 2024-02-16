class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({ :template => "photo_templates/index" }) 
  end

  def show
    url_photo_id = params.fetch("path_id")

    matching_photo_ids = Photo.where({ :id => url_photo_id })

    @the_photo = matching_photo_ids.first

    if @the_photo == nil
      redirect_to("/404")
    else
      render({ :template => "photo_templates/show" })
    end
  end
  
  def destroy
    the_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => the_id })

    @the_photo = matching_photos.at(0)

    @the_photo.destroy

    # render({ :template => "photo_templates/destroy" })
    redirect_to("/photos")
  end

end

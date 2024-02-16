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

  def create

    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    input_owner_id = params.fetch("input_owner_id")
    
    a_new_photo = Photo.new

    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    # render({ :template => "photo_templates/post"})
    redirect_to("/photos/#{a_new_photo.id}")
  end

  def update
    edit_image_input = params.fetch("edit_image_input")
    edit_caption_input = params.fetch("edit_caption_input")
    updated_image_id = params.fetch("path_id")

    updated_photo = Photo.where({ :id => updated_image_id }).first
    updated_photo.image = edit_image_input
    updated_photo.caption = edit_caption_input

    updated_photo.save

    redirect_to("/photos/#{updated_image_id}")
  end


end

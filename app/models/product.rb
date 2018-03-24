class Product < ActiveRecord::Base
  extend LeanTag::Taggable
  taggable_on :tags

  mount_uploader :image, ImageUploader
end

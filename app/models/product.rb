class Product < ActiveRecord::Base
  extend LeanTag::Taggable
  taggable_on :tags

  validates_inclusion_of :sell_status, :in => %w(Sellable Reject)

  serialize :images, JSON
  mount_uploaders :images, ImageUploader
end

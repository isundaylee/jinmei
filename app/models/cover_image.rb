class CoverImage < ActiveRecord::Base
  mount_uploader :image, CoverImageUploader

  belongs_to :page
end

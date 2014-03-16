class CoverImage < ActiveRecord::Base
  mount_uploader :image, CoverImageUploader
end

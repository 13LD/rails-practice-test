class Procesor < ApplicationRecord
  has_attached_file :document
  validates_attachment_presence :document
  validates_attachment_content_type :document, :content_type => ["application/zip", "application/x-zip"]

  # before_post_process :skip_for_zip
  #
  # def skip_for_zip
  #   ! %w(application/zip application/x-zip).include?(attachment_content_type)
  # end


end

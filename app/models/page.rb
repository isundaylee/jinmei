class Page < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', validate: true

  SUMMARY_LENGTH = 100

  def summary
    content[0...SUMMARY_LENGTH]
  end
end

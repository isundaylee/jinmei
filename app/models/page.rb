class Page < ActiveRecord::Base
  attr_accessible :title, :content, :category_ids

  has_and_belongs_to_many :categories
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', validate: true

  SUMMARY_LENGTH = 140
  SHORT_TITLE_LENGTH = 16

  def summary
    readable = readable_text

    if readable.length <= SUMMARY_LENGTH
      readable
    else
      readable[0...SUMMARY_LENGTH] + '...'
    end
  end

  def short_title
    if title.length <= SHORT_TITLE_LENGTH
      title
    else
      title[0...SHORT_TITLE_LENGTH] + '...'
    end
  end

  private

    def readable_text
      HTMLEntities.new.decode content.gsub(/<([^>]*?)>/, '')
    end
end

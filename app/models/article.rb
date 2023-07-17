class Article < ApplicationRecord
  has_one_attached :photo
  include PgSearch::Model

  pg_search_scope :search_by_title_and_body,
    against: [ :title, :body ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end

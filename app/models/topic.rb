class Topic < ActiveRecord::Base
  has_many :bookmarks

  #extend FriendlyId
  #friendly_id :title
end

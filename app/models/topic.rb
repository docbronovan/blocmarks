class Topic < ActiveRecord::Base
  has_many :bookmarks, dependent: :destroy

  #extend FriendlyId
  #friendly_id :title
end

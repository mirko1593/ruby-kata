class Message < ApplicationRecord
  belongs_to :room

  after_destroy_commit -> { broadcast_remove_to room }
end

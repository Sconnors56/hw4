class Entry < ApplicationRecord
  belongs_to :place
  belongs_to :user

  # ← Add this line to enable a single file attachment:
  has_one_attached :image

  # …any validations you already have…
end


class Character < ApplicationRecord
  belongs_to :user
  has_many :study_time
end

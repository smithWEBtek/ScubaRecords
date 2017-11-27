class Record < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :site
end

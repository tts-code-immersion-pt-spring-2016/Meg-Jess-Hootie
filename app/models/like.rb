class Like < ActiveRecord::Base
  belongs_to :user
  belonds_to :tweet
end

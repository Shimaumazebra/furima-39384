class Item < ApplicationRecord

  belong_to :users
  has_one   :perchases

end

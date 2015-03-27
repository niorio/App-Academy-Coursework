class PostSub < ActiveRecord::Base

  validates :post, :sub, presence: true
  validates :post, uniqueness: { scope: :sub }

  belongs_to :post,
    class_name: "Post",
    foreign_key: :post_id,
    primary_key: :id,
    inverse_of: :post_subs

  belongs_to :sub,
    class_name: "Sub",
    foreign_key: :sub_id,
    primary_key: :id,
    inverse_of: :post_subs

end

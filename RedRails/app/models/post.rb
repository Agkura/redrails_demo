# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :post_subs, :author, presence: true

  belongs_to :author, class_name: :User, foreign_key: :author_id
  has_many :post_subs, class_name: :PostSub, foreign_key: :post_id, inverse_of: :post
end

# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  body         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  commenter_id :integer
#  photo_id     :integer
#
class Comment < ApplicationRecord
  # Direct Associations

    belongs_to(:commenter, { :required => false, :class_name => "User", :foreign_key => "commenter_id" })

    belongs_to(:photo, { :required => false, :class_name => "Photo", :foreign_key => "photo_id", :counter_cache => true })

  # Validations

    validates(:photo_id, { :presence => true })

    validates(:commenter_id, { :presence => true })

    validates(:body, { :presence => true })
end

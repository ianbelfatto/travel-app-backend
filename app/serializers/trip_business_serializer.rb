class TripBusinessSerializer < ActiveModel::Serializer
  attributes :id, :comments, :edit_comments
  belongs_to :business
  def edit_comments
    false    
  end
end

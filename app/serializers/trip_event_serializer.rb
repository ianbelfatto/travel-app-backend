class TripEventSerializer < ActiveModel::Serializer
  attributes :id, :comments, :edit_comments
  belongs_to :event
  def edit_comments
    false    
  end
end

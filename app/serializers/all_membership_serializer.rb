class AllMembershipSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total

  def total
    Membership.sum(:charge)
  end
end

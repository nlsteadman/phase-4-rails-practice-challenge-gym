class AllMembershipSerializer < ActiveModel::Serializer
  attributes :id, :total
  has_many :memberships

  def total
    Membership.sum(:charge)
  end
end

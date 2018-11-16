class RentPolicy < ApplicationPolicy
  def index?
    if record.empty?
      true
    else
      user.id == record[0].user_id
    end
  end

  def create?
    record.user_id == user.id
  end
end

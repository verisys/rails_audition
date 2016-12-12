class MenuPolicy < Struct.new(:user, :menu)
  def owner?
    !user.nil? && user.has_role?(:owner)
  end

  def inventory?
    !user.nil? && (user.has_role?(:inventory) || user.has_role?(:sales))
  end

  def sales?
    !user.nil? && (user.has_role?(:owner) || user.has_role?(:sales))
  end
end
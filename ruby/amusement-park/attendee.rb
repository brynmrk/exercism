class Attendee
  attr_accessor :height, :pass_id

  def initialize(height)
    @height = height

    return self
  end

  def height
    @height
  end

  def pass_id
    @pass_id ? @pass_id : nil
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!
    @pass_id = nil
  end
end

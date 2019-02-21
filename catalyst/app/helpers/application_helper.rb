module ApplicationHelper
  def uninterpolate(str)
    Interpolatable.unparse(str)
  end
end

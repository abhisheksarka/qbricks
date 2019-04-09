module ApplicationHelper
  def uninterpolate(str)
    Interpolatable.unparse(str)
  end

  def current_dataset
    @current_dataset ||= JSON.parse($redis.get('current_dataset') || "{}")
  end
end

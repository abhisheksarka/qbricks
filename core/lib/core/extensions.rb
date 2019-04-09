class Hash
  # ea stands for escape angles
  def to_json_ea
    to_json.gsub('\u003c', '<').gsub('\u003e', '>')
  end
end

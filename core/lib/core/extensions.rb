class Hash
  # ea stands for escape angles
  def to_json_ea
    to_json.gsub('\u003c', '<').gsub('\u003e', '>')
  end

  def to_jquery_selector
    reduce('') { |acc, (k, v)| acc + "[#{k}='#{v}']" }
  end
end

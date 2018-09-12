class HashtagMappingService
  def initialize(resource, field_name)
    @resource = resource
    @field_value = resource[field_name]
  end


  def call
    map_hashtags!
  end


  private


  def map_hashtags!
    hashtag_regex.each do |item|
      hashtag = Hashtag.find_or_create_by(name: item[0])
      hashtag.mappings.find_or_create_by(hashtagable: @resource)
    end
  end


  def hashtag_regex
    @field_value.scan /(?:^|\s)#(\w+)/i
  end
end

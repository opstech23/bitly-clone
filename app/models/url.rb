class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  validates :long_url, :presence => true, :allow_blank => false
  validates :long_url, uniqueness: {case_sensitive: false, message: "was shortened before"}
  validates :long_url, format: {with: (URI::regexp(['http', 'https'])), message: "format is not good"}

  def base62
    base62 = ['0'..'9','A'..'Z','a'..'z']
    short_url = base62.map {|e| e.to_a}.flatten.sample(6)
    return short_url.join("")
  end
end

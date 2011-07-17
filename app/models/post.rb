require 'nokogiri'

class Post < ActiveRecord::Base


  # Preconditions - the object should be set up and these should be inside it already
  #   file_path
  #   url
  #   post_id
  #   slug
  def parse_file!(file_path)
    self.slug = ""
    self.post_id = ""
    
    File.open(file_path) do |f|
      doc = Nokogiri::HTML(f)
      doc.css('script').each { |node| node.remove }
      doc.css('link').each { |node| node.remove }

      self.title = doc.css("#postingTitle h1").text
      self.body = doc.css(".postingBody").text

      self.posted_at = Post.parse_date(doc.css(".adInfo").text) # TODO need to regex out the date from posted:

      #will serialize whole .posting
      posting = doc.css(".posting").text
      self.location = Post.parse_location(posting)
      self.age = Post.parse_age(posting)

      self.save
    end
  end

  # TODO parse and save phone and what else?
  def parse_phone
    # read from body and title
  end

  def self.parse_date(date_string)

    #  phone =  # TODO chop out everything but the numbers
    # take out all non-number, non-alpha characters
    # leave endlines
    # try with and without O => 0 conversion
    # alert if no phone number found
    #
    # [[num][up to 3 non digit characters]](can repeat as far as the numbers go)
    # at least nine numbers
    # if not, convert o => 0
    #   try again
  end

  # TODO need to regex out Location:
  def self.parse_location(posting_doc)

  end

  # TODO need to regex out Poster's age:
  def self.parse_age(posting_doc)

  end
end

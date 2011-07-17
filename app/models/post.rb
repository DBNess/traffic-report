require 'nokogiri'

class Post < ActiveRecord::Base

  after_initialize :setup_default_data

  def setup_default_data
    self.url = "http://newyork.backpage.com/#{category}/#{slug}/#{post_id}"
    @file_path = "../trafficking/backpage/newyork.backpage.com/#{category}/#{slug}/#{post_id}"
  end

  # Preconditions - the object should be set up and these should be inside it already
  #   file_path
  def parse_file!()
    File.open(@file_path) do |f|
      doc = Nokogiri::HTML(f)
      doc.css('script').each { |node| node.remove }
      doc.css('link').each { |node| node.remove }

      self.title = doc.css("#postingTitle h1").text
      self.body = doc.css(".postingBody").text

      self.posted_at = Post.parse_date(doc.css(".adInfo").text) # TODO need to regex out the date from posted:
      if posted_at.blank?
        logger.error "No date found for #{url}"
      end

      #will serialize whole .posting
      posting = doc.css(".posting").text
      self.location = Post.parse_location(posting)
      self.age = Post.parse_age(posting)
      if self.age.nil? || self.age == 0
        logger.error "No age found for #{url}"
      end

      self.save
    end
  end

  # TODO get the url somehow

  # TODO parse and save phone and what else?
  def parse_phone
    # read from body and title

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

  def self.parse_date(date_string)
    DateTime.strptime(date_string, "posted: %B %e, %Y, %I:%M %p").to_time
  end

  # TODO need to regex out Location:
  def self.parse_location(posting_text_with_meta)
    m = /Location: (.*)$/.match(posting_text_with_meta)
    m[1].strip if m
  end

  # TODO need to regex out Poster's age:
  def self.parse_age(posting_text_with_meta)
    m = /Poster's age: (\d+)/.match(posting_text_with_meta)
    m[1] if m
  end
end

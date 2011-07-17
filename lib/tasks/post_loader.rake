include 'nokogiri'

namespace :event do


  task :all => [:environment,
                :setup_start_rooms,
                :copy_questions,
                :reset_testing_rooms,
                :clear_instructions,
                :clear_queues ] do
    desc "Setting up an event"
  end

  desc "This sets up the start rooms for an event with the companies attending that event"
  task :setup_start_rooms => :environment do

  end

  def load_post(file_path)


    File.open(file_path) do |f|
      doc = Nokogiri::HTML(f)
      doc.css('script').each { |node| node.remove }
      doc.css('link').each { |node| node.remove }

      #url
      #category
      #post_id
      #slug
      title = doc.css("#postingTitle h1") #avoid link report ad
      body = doc.css(".postingBody")

      posted_at = doc.css(".adInfo") # TODO need to regex out the date from posted:

      #will serialize whole .posting
      location = doc.css(".posting") # TODO need to regex out what's after Location:
      age = doc.css(".posting") # TODO need to regex out Poster's age:

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

  end
end

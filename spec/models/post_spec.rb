require 'spec_helper'

describe Post do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "#parse_file!" do
    post = Post.new(:file_path =>
      "../trafficking/backpage/newyork.backpage.com/FemaleEscorts/great-choice-of-russian-dolls-22/22504536",
      :url => "")
    post.parse_file!

    puts post.url
    puts post.post_id
    puts post.slug
    puts post.title
    puts post.body
    puts post.posted_at
    puts post.location
    puts post.age

    post.url.should       == "http://newyork.backpage.com/FemaleEscorts/great-choice-of-russian-dolls-22/22504536"
    post.post_id.should   == "22504536"
    post.slug.should      == "FemaleEscorts"
    post.posted_at.should == Time.zone.local(2011, 7, 15, 1, 36, 00)
    post.age.should       == 22
    post.title.should  match /Great choice of RUSSIAN dolls/
    post.body.should   match /Dear Gentlemen/
  end

  describe "#parse_date" do
    Post.parse_date("posted: July 16, 2011, 10:01 PM").
            should == Time.zone.local(2011, 7, 16, 22, 1, 00)
  end

  describe "#parse_location" do

  end

  describe "#parse_age" do

  end

  describe "#parse_phone" do
    
  end
end

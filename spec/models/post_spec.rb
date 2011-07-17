require 'spec_helper'

describe Post do

  describe "#parse_file!" do

    it "should parse" do
      post = Post.new(
              :slug => "great-choice-of-russian-dolls-22",
              :category => "FemaleEscorts",
              :post_id => 22504536
      )
      post.parse_file!

      post.post_id.should   == 22504536
      post.category.should  == "FemaleEscorts"
      post.slug.should      == "great-choice-of-russian-dolls-22"
      post.posted_at.utc.should == Time.utc(2011, 7, 15, 13, 36, 00).utc
      post.age.should       == 22
      post.location.should  == "Midwood"
      post.title.should  match /Great choice of RUSSIAN dolls/
      post.body.should   match /Dear Gentlemen/
      post.url.should       == "http://newyork.backpage.com/FemaleEscorts/great-choice-of-russian-dolls-22/22504536"
    end
  end

  describe "#parse_phone" do
    
  end
end

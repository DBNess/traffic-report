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
      post.report_url.should == "http://posting.newyork.backpage.com/online/classifieds/ReportAd?oid=22504536"
    end
  end

  describe "#parse_phone" do

    it "should succeed" do
      SHOULD_SUCCEED.each do |phone_string|
        Post.parse_phone(phone_string).should_not be nil
      end
    end

    it "should fail" do
      SHOULD_FAIL.each do |phone_string|
        Post.parse_phone(phone_string).should be nil
      end
    end

    #newlines
    #upper case

    SHOULD_SUCCEED = [
        "nothing 347-901-5789 nothing",
        "nothing (341) 867-8289 nothing",
        "nothing (341) 867-8289 nothing",
        "nothing 341-867-8289 nothing",
        "nothing 341 867 8289 nothing",
        "nothing 341.867.8289 nothing",
        "nothing 341 867-8289 nothing",
        "nothing 341-867 8289 nothing",
        "nothing 341-867.8289 nothing",
        "nothing 3 4 1 - 924 - 6133 nothing",
        "nothing 3 4 1 8 6 7 8 2 8 9 nothing",
        "nothing 3:4:7..2:4:9..3:9:7:6 nothing ",
        "ohio 7148O5171O oranges",
        "ohio 7148O5171O Oranges",
        "ohio 7148o5171o oranges",
        "ohio 7148051710 oranges",
        "ohio 714 805 1710 oranges",
        "ohio 1 714 805 1710 oranges",
        "ohio 1-714-805-1710 oranges",
        "7148O5171O oranges",
        "7148O5171O Oranges",
        "7148o5171o oranges",
        "7148051710 oranges",
        "714 805 1710 oranges",
        "1 714 805 1710 oranges",
        "1-714-805-1710 oranges",
        "other 7148O5171O oranges",
        "other 7148O5171O Oranges",
        "other 7148o5171o oranges",
        "other 7148051710 oranges",
        "other 714 805 1710 oranges",
        "other 1 714 805 1710 oranges",
        "other 1-714-805-1710 oranges",
        "7148O5171O nothing",
        "7148O5171O nothing",
        "7148o5171o nothing",
        "7148051710 nothing",
        "714 805 1710 nothing",
        "1 714 805 1710 nothing",
        "1-714-805-1710 nothing",
        "ohio 7148O5171O nothing",
        "ohio 7148O5171O nothing",
        "ohio 7148o5171o nothing",
        "ohio 7148051710 nothing",
        "ohio 714 805 1710 nothing",
        "ohio 1 714 805 1710 nothing",
        "ohio 1-714-805-1710 nothing",
        "nothing 7148O5171O nothing",
        "nothing 7148O5171O nothing",
        "nothing 7148o5171o nothing",
        "nothing 7148051710 nothing",
        "nothing 714 805 1710 nothing",
        "nothing 1 714 805 1710 nothing",
        "nothing 1-714-805-1710 nothing",
        "nothing \\n nothing1-714-805-1710 nothing \\n nothing",
        "nothINg 1-714-805-1710 Nothing",
        "ohio 347-901-5789 ohio ",
        "ohio (341) 867-8289 ohio",
        "ohio (341) 867-8289 ohio",
        "ohio 341-867-8289 ohio",
        "ohio 341 867 8289 ohio",
        "ohio 341.867.8289 ohio",
        "ohio 341 867-8289 ohio",
        "ohio 341-867 8289 ohio",
        "ohio 341-867.8289 ohio",
        "ohio 3 4 1 - 924 - 6133 ohio",
        "ohio 3 4 1 8 6 7 8 2 8 9 ohio",
        "ohio 3:4:7..2:4:9..3:9:7:6 ohio"
      ]
      SHOULD_FAIL = [
        "reject 347-901-578 reject",
        "reject (341) 867-889 reject",
        "reject (341) 867-889 reject",
        "reject 341-867-82 reject",
        "reject 341 86 8289 reject",
        "reject 341.ddd7.8289 reject",
        "reject 341d 867-8289 reject",
        "reject 34=-867 8289 reject",
        "reject 3467.8289 reject",
        "reject 3 4 1 - 6133 reject",
        "reject 4 1 8 6 7 8 2 8 9 reject",
        "rejeCT :4:7..2:4:9..3:9:7:6  REject",
        "reject 34901-5789 reject",
        "reject (341separated) 867-8289 reject",
        "reject (3) 87-8289 reject",
        "reject 341-86-8289 reject",
        "reject 341 867 289 reject",
        "reject 341.867.82\\n89 reject",
        "reject 341 867-889 reject",
        "reject 341-87 8289 reject",
        "reject 31-867.8289 reject",
        "reject 3  1 8 6 7 8 2 8 9 reject",
        "reject :4:7..2:4:9..3:9:7:6  reject",
        "no phone number here"
      ]
  end

end

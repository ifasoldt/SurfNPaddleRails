class Ad
  attr_accessor :ad_picture, :ad_title, :ad_body

  def initialize(args)
    self.ad_picture         = args[:ad_picture]
    self.ad_title      = args[:ad_title]
    self.ad_body       = args[:ad_body]
  end

  def self.all
    unless defined?(@ads)
      @ads = [
        Ad.new(
        ad_picture: "brand",
        ad_title: "Quality Branding",
        ad_body: "Have you ever felt tired of holding down a cow and implanting a red hot iron into it's side? If so, then look no further. Quality Branding will take care of the whole process for a surprisingly low cost!"
        ),
        Ad.new(
        ad_picture: "dairy_castle",
        ad_title: "World's Best Ice Cream",
        ad_body: "Located in the heart of historic Greencastle, Dairy Castle is a great place to cool off during the hot summer months. All of our ice-cream is hand made!"
        ),
        Ad.new(
        ad_picture: "feed",
        ad_title: "Your Best Cows Now",
        ad_body: "Your cows are only as good as your feed. FeedNow is a company that can give you feed when you want it, at the prices you deserve."
        ),
        Ad.new(
        ad_picture: "freight",
        ad_title: "Cartwright Freight",
        ad_body: "Farming Logistics for the mid-size farmer. Call 765-721-4442 today."
        ),
        Ad.new(
        ad_picture: "john_deere",
        ad_title: "John Deere",
        ad_body: "Runs like a Deere. Serving the agricultural community for 35 years. Now offering the Gator 3.0"
        ),
        Ad.new(
        ad_picture: "guns",
        ad_title: "McAuliff's Beers and Bullets",
        ad_body: "Get drunk and shoot some stuff. Offering 1 and 2 day Pub/Firing Range crawls. Contact directly for longer adventures."
        )
      ]
    end
    @ads
  end

end

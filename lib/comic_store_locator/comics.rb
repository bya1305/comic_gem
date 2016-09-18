class ComicStoreLocator::Comics
  attr_accessor :name, :address

  @zip = ''
  @stores = []
  def initialize(name=nil, address=nil)
    @name = name
    @address = address
  end

  def self.get_zip
    @zip = gets.strip
  end

  def self.scrape_from_yp
    doc = Nokogiri::HTML(open("http://www.yellowpages.com/search?search_terms=comics&geo_location_terms=#{@zip}"))
    store_arr = doc.css("div.info")
    store_arr.each do |store|
      ind_store = self.new(
      store.search("h3.n a").text,
      store.search("p.adr span.street-address").text
      )
      @stores << ind_store
    end
    @stores
  end

end

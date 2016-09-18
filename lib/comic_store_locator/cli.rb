class ComicStoreLocator::CLI

  @zip = ''
  def call
    puts "Welcome to Comic Store Locator!"
    grab_zipcode
  end

  def grab_zipcode
    puts "Please enter your zip code"
    puts "------------------"
    @zip = gets.strip
  end





end

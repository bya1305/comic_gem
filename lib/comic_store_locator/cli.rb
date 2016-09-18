class ComicStoreLocator::CLI


  def call
    puts "Welcome to Comic Store Locator!"
    grab_zipcode
    find_stores
    menu
    goodbye
  end

  def grab_zipcode
    puts "Please enter your zip code"
    puts "------------------"
    ComicStoreLocator::Comics.get_zip
    puts "------------------"
    puts "------------------"
    puts "----Searching-----"
    puts "------------------"
    puts "------------------"
    puts "These are the stores in your zip code!"
    puts ""

  end

  def find_stores
    @@store_list = ComicStoreLocator::Comics.scrape_from_yp
    @@store_list.each.with_index(1) do |store, i|
      puts "#{i}. #{store.name}"
    end
  end

  def menu
    input = '';
    while input != 'exit'
      puts ""
      puts ""
      puts "Which store would you like the address of? (number)"
      puts "You can also type list to see the store list again or exit to exit program"
      input = gets.strip.downcase
      if input.to_i > 0
        store = @@store_list[input.to_i-1]
        puts "#{store.address}"
      elsif input == "list"
        find_stores
      end
    end

  end

  def goodbye
    puts ""
    puts ""
    puts "Goodbye! Thanks for visiting!"
  end



end

# You are given an array of csv strings indicating search results.  Each has a host_id, # listing_id, score, and city.  Initially, results are sorted by highest score.
#
# We’d like to display these search results on a web page.  Write a function that
# returns groups of listings to be displayed on each page.  However, note that a
# given host may have several listings that show up in the results.  Reorder the
# list so that a host shows up at most once on a page if possible, but otherwise
# preserves the ordering.
#
# Your program should return the new array and print out the results in blocks
# representing the pages.
#
# Input:
# *  An array of csv strings, with sort score
# *  number of results per page
#

input_csv_array = [
  "host_id,listing_id,score,city",
  "1,28,300.1,San Francisco",
  "4,5,209.1,San Francisco",
  "20,7,208.1,San Francisco",
  "23,8,207.1,San Francisco",
  "16,10,206.1,Oakland",
  "1,16,205.1,San Francisco",
  "6,29,204.1,San Francisco",
  "7,20,203.1,San Francisco",
  "8,21,202.1,San Francisco",
  "2,18,201.1,San Francisco",
  "2,30,200.1,San Francisco",
  "15,27,109.1,Oakland",
  "10,13,108.1,Oakland",
  "11,26,107.1,Oakland",
  "12,9,106.1,Oakland",
  "13,1,105.1,Oakland",
  "22,17,104.1,Oakland",
  "1,2,103.1,Oakland",
  "28,24,102.1,Oakland",
  "18,14,11.1,San Jose",
  "6,25,10.1,Oakland",
  "19,15,9.1,San Jose",
  "3,19,8.1,San Jose",
  "3,11,7.1,Oakland",
  "27,12,6.1,Oakland",
  "1,3,5.1,Oakland",
  "25,4,4.1,San Jose",
  "5,6,3.1,San Jose",
  "29,22,2.1,San Jose",
  "30,23,1.1,San Jose"
]

def print_listings(input_csv_array, num_listings_per_page)

  page_number = 0

  current_listing = 1
  while current_listing <= input_csv_array.length - 1
    puts "Printing page #{page_number + 1}"

    i = 0
    while i < num_listings_per_page
      puts input_csv_array[current_listing] if !input_csv_array[i].nil?
      i += 1
      current_listing += 1
    end
    page_number += 1
    puts
  end
end

def print_listings_without_repeating_host(input_csv_array, num_listings_per_page)
  return if input_csv_array.size < 1
  current_listing = 1
  page_number = 1
  pending_list = []
  while current_listing < input_csv_array.length - 1
    host_map = {}
    puts "Printing page #{page_number}"

    i = 0
    while i < num_listings_per_page

      (0..pending_list.length-1).each do |index|
        listing = pending_list[index]
        host = listing.split(',')[0]

        if host_map[host].nil?
          host_map[host] = true
          puts listing
          i += 1
          pending_list.delete(listing)
        end
      end

      if i < num_listings_per_page
        new_listing = input_csv_array[current_listing]
        break if new_listing.nil?
        new_host = new_listing.split(',')[0]

        if host_map[new_host].nil?
          puts new_listing
          i += 1
          current_listing += 1
          host_map[new_host] = true
        else
          pending_list.push(input_csv_array[current_listing])
          current_listing += 1
        end
      end

    end
    page_number += 1
    puts
  end
end

# print_listings(input_csv_array, 5)

print_listings_without_repeating_host(input_csv_array, 6)

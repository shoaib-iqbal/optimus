class BillsService
  def initialize
  end
  def get_all_bills(skip = 0)
    url = URI("https://bills-api.parliament.uk/api/v1/Bills?SortOrder=DateUpdatedDescending&Take=1000&Skip=#{skip}")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["Cookie"] = "__cf_bm=FB1AhO0tXb31IWm0PgMQj3i_C44Q2w3GLLODhkHm1pU-1672752995-0-AQY77AG+4UB2s6ZNlO1EYL9wZS9+LlGNqvst4i1aq5V5L93JFHe9+MBBdqowuZQBYu2yx1/kn13o+7+LmxdszOo="

    response = https.request(request)
    JSON.parse response.read_body
  end
end
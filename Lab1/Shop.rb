require 'mechanize'
require "Nokogiri"
require 'logger'
require 'csv'
require_relative 'Data/ConfigureData'
require_relative 'Models/Clother'
require_relative 'Models/Category'
require_relative 'Models/Gender'
require_relative 'Models/Trend'
require_relative 'Models/Nominal'
require_relative 'Data/Selectors'
class Shop
  include SiteData
  include Selectors

  def self.readData(product)
    id = product[ID]
    name = product.css(NAME).text
    label = product.css(LABEL).text
    image = product.css(IMAGE).attr(PHOTO_SOURCE)
    price_currency = product.css(PRICE).text.split
    price = price_currency[0]
    if (price_currency[1] != nil) then
      currency = price_currency[1]

    end
    return Clother.new(id, name, label, price, currency, image)
  end

  def self.writeCsv(fileName, clother, header)
    CSV.open(fileName, "w+", :write_headers => true,
             :headers => header) do |csv|
      clother.each { |element| csv.puts(element) }
    end
    return nil
  end

  agent = Mechanize.new
  agent.log = Logger.new "mech.log"
  agent.user_agent_alias = 'Mac Safari'

  page = agent.get BASE_PAGE_PATH
  @@people_gender = []
  @@clother_category = []
  @@res_data = []
  @@currency = []
  @@trend = []
  person = page.css(PERSON)
  person.each do |gender|
    button = page.css(MENU_BUTTON)
    button.each do |cat_link|
      gender_tmp = Gender.new(gender.text).getGender
      @@people_gender << gender_tmp if !@@people_gender.include?(gender_tmp)
      clother_category_tmp = (Category.new(cat_link.text)).getCategory
      @@clother_category << clother_category_tmp if !@@clother_category.include?(clother_category_tmp)

      data = agent.click(cat_link)
      data.css('.product').each do |product|
        clother_details = readData(product)

        currency_tmp = Nominal.new(clother_details.currency).name
        trend_tmp = (Trend.new(clother_details.trend)).name
        clother_details.gender = gender_tmp.first
        clother_details.category = clother_category_tmp.first
        @@res_data << clother_details.getClother if !@@res_data.include?(clother_details.getClother)
        @@currency << currency_tmp if !@@currency.include?(currency_tmp)
        @@trend << trend_tmp if !@@trend.include?(trend_tmp)

      end
    end
  end
  writeCsv(PRODUCT_FILE_NAME, @@res_data, PRODUCT_HEADER)
  writeCsv(PEOPLE_FILE_NAME, @@people_gender, PEOPLE_HEADER)
  writeCsv(CATEGORY_FILE_NAME, @@clother_category, CATEGORY_HEADER)
  writeCsv(CURRENCY_FILE_NAME, @@currency, CURRENCY_HEADER)
  writeCsv(TREND_FILE_NAME, @@trend, TREND_HEADER)
end

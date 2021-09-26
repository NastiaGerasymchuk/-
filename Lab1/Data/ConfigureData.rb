module SiteData
  PRODUCT_HEADER= %w[id  description title  price nominal img gender category]
  PEOPLE_HEADER= %w[person]
  CATEGORY_HEADER= %w[category]
  CURRENCY_HEADER= %w[currency]
  TREND_HEADER= %w[trend]
  BASE_PAGE_PATH="https://www.desigual.com/es_ES/"
  PRODUCT_FILE_NAME='csvData/product.csv'
  PEOPLE_FILE_NAME='csvData/people.csv'
  CATEGORY_FILE_NAME='csvData/category.csv'
  CURRENCY_FILE_NAME='csvData/currency.csv'
  TREND_FILE_NAME='csvData/trend.csv'
  JSON_FILE_NAME='jsonData/product.txt'
  FROM_JSON_FILE_NAME='jsonData/product.json'
  TO_CSV_FILE_NAME='fromJsonToCsv/product.csv'
end

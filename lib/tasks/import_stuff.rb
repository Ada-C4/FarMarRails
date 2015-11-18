require 'csv'
namespace :csv do

  desc "Import CSV Data"
  task :import_stuff => :environment do

    csv_file_path_markets = './seed_csvs/markets.csv'

    CSV.foreach(csv_file_path_markets) do |row|
      Market.create!({
        :id => row[0],
        :name => row[1],
        :address => row[2],
        :city => row[3],
        :county => row[4],
        :state => row[5],
        :zip => row[6]
      })
    end
    # csv_file_path_product_sales = './seed_csvs/product_sales.csv'
    #
    # CSV.foreach(csv_file_path_product_sales) = './'

  end
end

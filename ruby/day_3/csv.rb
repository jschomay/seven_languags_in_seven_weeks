module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  class CsvObject
    def initialize(headers, contents)
      @headers = headers
      @contents = contents
    end

    # def one
    #   @contents.map { |row| row[0] }
    # end

    def method_missing(name, *args, &block)
      # todo - defined missing method to pull the right index from each contents
      index =  @headers.index(name.to_s)
      @contents.map { |row| row[index] }
    end
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      @file = File.new(filename)
      @headers = @file.gets.chomp.split(', ')

      @file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each
      yield CsvObject.new @headers, @csv_contents
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end
end

class OzCsv
  include ActsAsCsv
  acts_as_csv
end

oz = OzCsv.new
puts oz.headers.inspect
puts oz.csv_contents.inspect
puts "Just the first ones now:"
oz.each { |row| puts row.one }

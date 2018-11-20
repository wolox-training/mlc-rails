class OpenLibraryService
  include HTTParty
  base_uri 'https://openlibrary.org'
  attr_reader :options

  def initialize(isbn)
    @isbn = isbn
    @uri = "/api/books?bibkeys=ISBN:#{@isbn}&format=json&jscmd=data"
  end

  def book_info
    raise 'Error fetching data from OpenLibrary API' if retrieve_data.code.to_i != 200
    format_response(retrieve_data.parsed_response)
  end

  private

  def retrieve_data
    self.class.get(@uri)
  end

  def format_response(response)
    response = response["ISBN:#{@isbn}"]
    {
      ISBN: @isbn,
      title: response['title'],
      subtitle: response['subtitle'],
      number_of_pages: response['number_of_pages'],
      authors: response['authors'].map { |data| data['name'] }
    }
  end
end

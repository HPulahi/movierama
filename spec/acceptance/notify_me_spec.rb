require 'rails_helper'
require 'capybara/rails'
require 'support/pages/movie_list'
require 'support/with_user'

RSpec.describe 'notify me', type: :feature do

  let(:page) { Pages::MovieList.new }

  before do
    author = User.create(
      uid:  'null|12345',
      name: 'Bob'
    )
    Movie.create(
      title:        'Batman vs Superman',
      description:  'The greatest gladiator match. God vs Man',
      date:         '2016-03-25',
      user:         author
    )
  end

  context 'when logged out' do
    it 'cannot notify' do
      page.open
      expect {
        page.like('Batman vs Superman')
      }.to raise_error(Capybara::ElementNotFound)
    end
  end

end

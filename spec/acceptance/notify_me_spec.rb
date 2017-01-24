require 'rails_helper'
require 'capybara/rails'
require 'support/pages/movie_list'
require 'support/pages/movie_new'
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
        page.notify('Batman vs Superman')
      }.to raise_error(Capybara::ElementNotFound)
    end
  end

  context 'when logged in' do
    with_logged_in_user

    before { page.open }

    it 'can notify on submitted movies' do
      Pages::MovieNew.new.open.submit(
        title:       'The Party',
        date:        '1969-08-13',
        description: 'Birdy nom nom'
        )
      page.open
      page.notify('The Party')
    end

    # it can not notify on submitted movies
  end
end

ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require 'devise'
require 'minitest/autorun'
require 'minitest/pride'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def prepare_meals
    Meal.all.each do |meal|
      meal.update(entree_id: entrees(:one).id)
      meal.update(side_ids: nil)
      meal.update(side_ids: Side.pluck(:id).sample(2))
    end
  end
end

module ActionDispatch
  class IntegrationTest
    include Devise::Test::IntegrationHelpers
  end
end

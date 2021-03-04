require "test_helper"

class RandomizeCurrentEntreesJobTest < ActiveJob::TestCase
  test 'job can be queued' do
    assert_enqueued_jobs 0
    RandomizeCurrentEntreesJob.perform_later
    assert_enqueued_jobs 1
  end

  test 'should change current entree and sides' do
    Entree.all.each do |entree|
      entree.update(side_category_ids: SideCategory.pluck(:id).sample(2),
                    number_of_sides: 2)
    end
    current_entrees_count = Entree.current.count
    current_entree_ids = Entree.current.pluck(:id)

    RandomizeCurrentEntreesJob.perform_now
    assert_equal 7, Entree.current.count
    assert_not_equal current_entree_ids, Entree.current.pluck(:id)
  end

  test 'should handle entrees with no sides' do
    Entree.all.each do |entree|
      entree.update(number_of_sides: 0, side_category_ids: [])
    end
    assert_not_nil Side.current.count

    RandomizeCurrentEntreesJob.perform_now
    assert_equal 7, Entree.current.count
    assert_equal 0, Side.current.count
  end

  test 'should create new grocery list at the end' do
    assert_difference('GroceryList.count') do
      RandomizeCurrentEntreesJob.perform_now
    end
  end
end

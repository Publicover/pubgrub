require "test_helper"

class RandomizeCurrentEntreesJobTest < ActiveJob::TestCase
  test 'job can be queued' do
    assert_enqueued_jobs 0
    RandomizeCurrentEntreesJob.perform_later
    assert_enqueued_jobs 1
  end

  test 'should change current meals' do
    current_entrees_count = Entree.current.count
    current_entree_ids = Entree.current.pluck(:id)

    RandomizeCurrentEntreesJob.perform_now
    assert_equal 7, Entree.current.count
    assert_not_equal current_entree_ids, Entree.current.pluck(:id)
  end
end

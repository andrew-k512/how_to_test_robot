require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'


class TestRobot < MiniTest::Test




  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    robot = Robot.new
    robot.needs_repairs = true
    robot.foreign_model = true

    result = robot.station

    assert_equal(result, 1)

  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    robot = Robot.new
    robot.needs_repairs = true
    robot.vintage_model = true

    result = robot.station

    assert_equal(result, 2)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    robot = Robot.new
    robot.needs_repairs = true

    result = robot.station

    assert_equal(result, 3)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    robot = Robot.new
    robot.needs_repairs = false

    result = robot.station

    # assert
    assert_equal(result, 4)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    robot = Robot.new
    robot.todos = []
    # act
    result = robot.prioritize_tasks

    # assert
    assert_equal(result, -1)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    robot = Robot.new
    robot.todos = [1, 4, 8, 9]
    # act
    result = robot.prioritize_tasks
    # assert
    assert_equal(result, 9)
  end

  def test_workday_on_day_off_returns_false
    # arrange
    robot = Robot.new
    robot.day_off = 'tuesday'

    # act
    result = robot.workday?('tuesday')

    # assert
    assert_equal(result, false)

  end

  def test_workday_not_day_off_returns_true
    # arrange
    robot = Robot.new
    robot.day_off = 'tuesday'

    # act
    result = robot.workday?('monday')

    # assert
    assert_equal(result, true)
  end

end

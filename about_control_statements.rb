require File.expand_path(File.dirname(__FILE__) + '/neo')  # => true

class AboutControlStatements < Neo::Koan

  def test_if_then_else_statements
    if true                           # => true
      result = :true_value            # => :true_value
    else
      result = :false_value
    end                               # => :true_value
    assert_equal :true_value, result  # => true
  end

  def test_if_then_statements
    result = :default_value           # => :default_value
    if true                           # => true
      result = :true_value            # => :true_value
    end                               # => :true_value
    assert_equal :true_value, result  # => true
  end

  def test_if_statements_return_values
    value = if true                     # => true
              :true_value               # => :true_value
            else
              :false_value
            end                         # => :true_value
    assert_equal :true_value, value     # => true

    value = if false                  # => false
              :true_value
            else
              :false_value            # => :false_value
            end                       # => :false_value
    assert_equal :false_value, value  # => true

    # NOTE: Actually, EVERY statement in Ruby will return a value, not
    # just if statements.
  end

  def test_if_statements_with_no_else_with_false_condition_return_value
    value = if false                                                     # => false
              :true_value
            end                                                          # => nil
    assert_equal nil, value                                              # => true
  end

  def test_condition_operators
    assert_equal :true_value, (true ? :true_value : :false_value)    # => true
    assert_equal :false_value, (false ? :true_value : :false_value)  # => true
  end

  def test_if_statement_modifiers
    result = :default_value        # => :default_value
    result = :true_value if true   # => :true_value

    assert_equal :true_value, result  # => true
  end

  def test_unless_statement
    result = :default_value            # => :default_value
    unless false    # same as saying 'if !false', which evaluates as 'if true'
      result = :false_value            # => :false_value
    end                                # => :false_value
    assert_equal :false_value, result  # => true
  end

  def test_unless_statement_evaluate_true
    result = :default_value                # => :default_value
    unless true    # same as saying 'if !true', which evaluates as 'if false'
      result = :true_value
    end                                    # => nil
    assert_equal :default_value, result    # => true
  end

  def test_unless_statement_modifier
    result = :default_value             # => :default_value
    result = :false_value unless false  # => :false_value

    assert_equal :false_value, result  # => true
  end

  def test_while_statement
    i = 1                         # => 1
    result = 1                    # => 1
    while i <= 10                 # => true, true, true, true, true, true, true, true, true, true, false
      result = result * i         # => 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800
      i += 1                      # => 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
    end                           # => nil
    assert_equal 3628800, result  # => true
  end

  def test_break_statement
    i = 1                         # => 1
    result = 1                    # => 1
    while true                    # => true, true, true, true, true, true, true, true, true, true, true
      break unless i <= 10        # => true, true, true, true, true, true, true, true, true, true, false
      result = result * i         # => 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800
      i += 1                      # => 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
    end                           # => nil
    assert_equal 3628800, result  # => true
  end

  def test_break_statement_returns_values
    i = 1                                  # => 1
    result = while i <= 10                 # => true, true
      break i if i % 2 == 0                # => false, true
      i += 1                               # => 2
    end                                    # => 2

    assert_equal 2, result  # => true
  end

  def test_next_statement
    i = 0                                 # => 0
    result = []                           # => []
    while i < 10                          # => true, true, true, true, true, true, true, true, true, true, false
      i += 1                              # => 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
      next if (i % 2) == 0                # => false, true, false, true, false, true, false, true, false, true
      result << i                         # => [1], [1, 3], [1, 3, 5], [1, 3, 5, 7], [1, 3, 5, 7, 9]
    end                                   # => nil
    assert_equal [1, 3, 5, 7, 9], result  # => true
  end

  def test_for_statement
    array = ["fish", "and", "chips"]               # => ["fish", "and", "chips"]
    result = []                                    # => []
    for item in array                              # => ["fish", "and", "chips"]
      result << item.upcase                        # => ["FISH"], ["FISH", "AND"], ["FISH", "AND", "CHIPS"]
    end                                            # => ["fish", "and", "chips"]
    assert_equal ["FISH", "AND", "CHIPS"], result  # => true
  end

  def test_times_statement
    sum = 0                 # => 0
    10.times do             # => 10
      sum += 1              # => 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    end                     # => 10
    assert_equal 10, sum
  end

end

# >> [32mAboutControlStatements#test_for_statement has expanded your awareness.[0m
# >> [31mAboutControlStatements#test_times_statement has damaged your karma.[0m
# >>
# >> The Master says:
# >> [36m  You have not yet reached enlightenment.[0m
# >> [36m  You are progressing. Excellent. 14 completed.[0m
# >>
# >> The answers you seek...
# >> [31m  Expected "FILL ME IN" to equal 10[0m
# >>
# >> Please meditate on the following code:
# >> [31m  /Users/chris/theironyard/week2/day1/koans/about_control_statements.rb:139:in `test_times_statement'[0m
# >>
# >> [32mremember that silence is sometimes the best answer[0m
# >> [32myour path thus far [[0m[32m..............................................[0m[31mX[0m[36m___[0m[32m][0m 14/15

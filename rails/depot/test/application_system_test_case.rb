require "test_helper"

class ActionDispatch::SystemTestCase
  include AuthenticationHelpers
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end

module Mongoid
  class TestCase < ActiveSupport::TestCase #:nodoc:
    def assert_date_from_db(expected, actual, message = nil)
      assert_equal expected.to_s, actual.to_s, message
    end

    def with_kcode(kcode)
      if RUBY_VERSION < '1.9'
        orig_kcode, $KCODE = $KCODE, kcode
        begin
          yield
        ensure
          $KCODE = orig_kcode
        end
      else
        yield
      end
    end
  end
end
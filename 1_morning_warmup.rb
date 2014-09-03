# Solutions:

require 'minitest/autorun'

class TestRubyBehaviors < MiniTest::Unit::TestCase

    def test_divide_by_zero_raises_an_error()
        assert_raises(ZeroDivisionError) do
            100 / 0
        end
    end

    def test_nonexistant_hash_key_return_nil()
        empty_hash = {}
        nonexistant_key_value = empty_hash[:dogs]
        assert_nil(nonexistant_key_value)
    end

    def test_calling_nonexistant_method_raises_error()
        assert_raises(NoMethodError) do
            some_method()
        end
    end

    def test_using_nonexistant_name_raises_error()
        assert_raises(NameError) do
            some_method_or_local_variable
        end
    end

    def test_change_nil_into_string()
        air = nil.to_s()
        assert_equal("", air)
    end

    def test_putting_nil_into_string_via_interpolation_is_no_problem()
        assert_equal("No  problem", "No #{nil} problem")
    end

    def test_accessing_nonexistant_array_index_returns_nil()
        person = ["Jones"]
        assert_nil(person[1])
    end

    def test_read_nonexistant_file()
        assert_raises(Errno::ENOENT) do
            File.read("christmas_list.md")
        end
    end

    def test_read_file_that_exists()
        skip
        new_file = File.new("christmas_list.md", "w+")
        new_file.print("Hello")
        new_file.close

        assert_equal("Hello", File.read("christmas_list.md"))
    end

    def test_my_own_read_nonexistant_file()
        begin
            File.read("christmas_list.md")
        rescue Errno::ENOENT => error
            assert_instance_of(Errno::ENOENT, error)
        end
    end

    def test_splitting_string_by_empty_string()
        sauce = "Sriracha"
        expected = ["S", "r", "i", "r", "a", "c", "h", "a"]
        assert_equal(expected, sauce.split(""))
    end

end
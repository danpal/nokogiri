require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module Nokogiri
  module XML
    class TestProcessingInstruction < Nokogiri::TestCase
      def setup
        @xml = Nokogiri::XML.parse(File.read(XML_FILE), XML_FILE)
      end

      def test_type
        assert_equal(Node::PI_NODE, @xml.children[0].type)
      end

      def test_name
        assert_equal 'TEST-STYLE', @xml.children[0].name
      end

      def test_new
        assert ref = ProcessingInstruction.new(@xml, 'name', 'content')
        assert_instance_of ProcessingInstruction, ref
      end
    end
  end
end
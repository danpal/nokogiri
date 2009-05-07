module Nokogiri
  module LibXML
    module XmlXpathContextMixin
      def self.included(base)
        base.class_eval do

          layout(
            :doc,  :pointer,
            :node, :pointer
            )

        end
      end

      def node
        LibXML::XmlNode.new(self[:node])
      end

      def doc
        LibXML::XmlDocumentCast.new(self[:doc])
      end
    end

    class XmlXpathContext < FFI::ManagedStruct
      include XmlXpathContextMixin

      def self.release ptr
        LibXML.xmlXPathFreeContext(ptr)
      end
    end

    class XmlXpathContextCast < FFI::Struct
      include XmlXpathContextMixin
    end

  end
end
module Kramdown
  module Converter
    class PlainText < Base

      # Instantiate a PlainText converter
      # @param[Kramdown::Element] root
      # @param[Hash] options
      def initialize(root, options)
        super
        @plain_text = '' # collector for plain text string
      end

      # Extract conversion dispatcher into class method so that we can use it
      # from other places (e.g., when patching Kramdown::Element#to_plain_text)
      # @param el [Kramdown::Element]
      # @return [Array<String>, Nil] tuple of before and after text or nil if nothing to do
      def self.convert_el(el)
        case el.type
        when :a
          # nothing to do
        when :blank
          # nothing to do
        when :em
          # nothing to do
        when :entity
          # Decode whitelisted entities
          [Repositext::Utils::EntityEncoder.decode(el.options[:original]), nil]
        when :gap_mark
          # nothing to do
        when :header
          # nothing to do
        when :hr
          # nothing to do
        when :p
          # nothing to do
        when :record_mark
          # nothing to do
        when :root
          # nothing to do
        when :strong
          # nothing to do
        when :subtitle_mark
          # nothing to do
        when :xml_comment
          # nothing to do
        when :typographic_sym
          # nothing to do
        when :text
          # capture value of all :text elements
          [el.value, nil]
        else
          raise "Handle this element: #{ el.inspect } #{ el.type }"
        end
      end

      # Extracts plain text from tree
      # @param[Kramdown::Element] el
      # @return[String] the plain text
      def convert(el)
        before, after = self.class.convert_el(el)
        @plain_text << before  if before

        # walk the tree
        el.children.each { |e| convert(e) }

        @plain_text << after  if after

        if :root == el.type
          # return @plain_text for :root element
          return @plain_text.strip
        end
      end
    end
  end
end


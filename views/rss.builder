xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Mustardamus"
    xml.description "Some words from a dude addicted to mustard."
    xml.link "http://mustardamus.com"

    ARTICLES.each do |article|
      xml.item do
        xml.title article[:title]
        xml.link "http://mustardamus.com/articles/#{article[:url]}"
        xml.description { xml.cdata!("<a href='http://mustardamus.com/articles/#{article[:url]}'>Go to article &raquo;</a>") }
        xml.pubDate article[:created].rfc822
        xml.guid "http://mustardamus.com/articles/#{article[:url]}"
      end
    end
  end
end

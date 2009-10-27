atom_feed do |feed|
 feed.title"Publications" 
 feed.updated(@publications.first.created_at)
 
 @publications.each do |publication|
   feed.entry(publication) do |entry|
     entry.title(publication.title)
     entry.content(publication.category, :type=> 'html')
     entry.author{ |author|  author.name("focon")}
end
end
end
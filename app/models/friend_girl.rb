class Friend_girl < Neo4j::Rails::Relationship
	property :provider, :type => String, :index => :exact
end

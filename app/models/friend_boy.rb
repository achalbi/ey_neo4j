class Friend_boy < Neo4j::Rails::Relationship
	property :provider, :type => String, :index => :exact
end

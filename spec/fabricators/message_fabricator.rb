Fabricator(:message) do
  job(:fabricator => :job)
  sender(:fabricator => :user)
  content   "MyText"
end

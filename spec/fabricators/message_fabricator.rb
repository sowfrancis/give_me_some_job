Fabricator(:message) do
  job       nil
  sender(:fabricator => :user)
  content   "MyText"
end

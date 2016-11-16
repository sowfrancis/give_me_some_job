Geocoder.configure(
 :timeout => 20,

 # to use an API key:
  :api_key => ENV["GOOGLE_PLACES_API"],

  :lookup => :google,

  :use_https => true
)
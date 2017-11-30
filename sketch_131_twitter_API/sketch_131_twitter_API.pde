Twitter twitterInstance;
Query queryForTwitter;
ArrayList tweets;

void setup() {
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("LdgIacQNpuwq4i7WOsDLW7pBD"); 
  cb.setOAuthConsumerSecret("4sPFymnWCZOETDvElKTDmh6bgcWPjAGVLwNFyhWxL3dZmHvuwI"); 
  cb.setOAuthAccessToken("933119577273204736-HawgKvgJVBYLBiUPIzeC75eLnKtKLRk");
  cb.setOAuthAccessTokenSecret("TYKn4Sez3MfMcEKR0xsT9ZApp6omBCxjHaSmJLqB1tafv");


  twitterInstance = new TwitterFactory(cb.build()).getInstance();
  queryForTwitter = new Query("#t");

  size(640, 440);
  FetchTweets();
}

void draw() {
  background(0);
  DrawTweets();
}


void DrawTweets() {
  for (int i=0; i<tweets.size(); i++) {
    Status t = (Status) tweets.get(i);
    String user = t.getUser().getName();
    String msg = t.getText();
    text(user + ":" + msg, 20, (15 + i*35-mouseY), width-20, 40);
  }
}

void FetchTweets() {
  try {
    QueryResult result = twitterInstance.search(queryForTwitter);
    tweets = (ArrayList) result.getTweets();
  } catch(TwitterException te) {
    println("Couldn't connect:  " + te);
  }
}
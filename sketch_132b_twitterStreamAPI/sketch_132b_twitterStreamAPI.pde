import twitter4j.util.*;
import twitter4j.*;
import twitter4j.management.*;
import twitter4j.api.*;
import twitter4j.conf.*;
import twitter4j.json.*;
import twitter4j.auth.*;
 
TwitterStream twitterStream;
 
 
void setup() {     
  size(100, 100);    
  background(0); 
  openTwitterStream();
}  
 
void draw() {     
  background(0);
}  
 
void openTwitterStream() {  
 
  ConfigurationBuilder cb = new ConfigurationBuilder();  
  cb.setOAuthConsumerKey("LdgIacQNpuwq4i7WOsDLW7pBD");
  cb.setOAuthConsumerSecret("4sPFymnWCZOETDvElKTDmh6bgcWPjAGVLwNFyhWxL3dZmHvuwI");
  cb.setOAuthAccessToken("933119577273204736-HawgKvgJVBYLBiUPIzeC75eLnKtKLRk");
  cb.setOAuthAccessTokenSecret("TYKn4Sez3MfMcEKR0xsT9ZApp6omBCxjHaSmJLqB1tafv"); 
 
  TwitterStream twitterStream = new TwitterStreamFactory(cb.build()).getInstance();
 
  FilterQuery filtered = new FilterQuery();
 
  String keywords[] = {
    "hangover"
  };

  filtered.track(keywords);

  twitterStream.addListener(listener);
 
  if (keywords.length==0) {

    twitterStream.sample();
  } else { 
    twitterStream.filter(filtered);
  }
  println("connected");
} 
 
 
StatusListener listener = new StatusListener() {
 
  public void onStatus(Status status) {
    System.out.println("@" + status.getUser().getScreenName() + " - " + status.getText());
  }
 
  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {
    System.out.println("Got a status deletion notice id:" + statusDeletionNotice.getStatusId());
  }
 
  public void onTrackLimitationNotice(int numberOfLimitedStatuses) {
    System.out.println("Got track limitation notice:" + numberOfLimitedStatuses);
  }
 
  public void onScrubGeo(long userId, long upToStatusId) {
    System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
  }

  public void onStallWarning(StallWarning warning) {
    System.out.println("Got stall warning:" + warning);
  }
 
  public void onException(Exception ex) {
    ex.printStackTrace();
  }
};
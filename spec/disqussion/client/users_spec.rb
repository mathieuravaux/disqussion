require 'helper'

describe Disqussion::Users do
  Disqussion::Configuration::VALID_FORMATS.each do |format|
    context ".new(:format => '#{format}')" do
      before do
        @client = Disqussion::Client.users
      end
      
      describe ".details" do
        it "get the correct resource" do
          stub_get("users/details.json").
            to_return(:body => fixture("users/details.json"), :headers => {:content_type => "application/json; charset=utf-8"})
          
          @client.details
          
          a_get("users/details.json").should have_been_made
        end
      end
      
      describe ".follow" do
        it "get the correct resource" do
          stub_post("users/follow.json", :body => { :target => "1234" }).
            to_return(:body => fixture("users/follow.json"), :headers => {:content_type => "application/json; charset=utf-8"})
          
          @client.follow(1234)
          
          a_post("users/follow.json", :body => { :target => "1234"}).should have_been_made
        end
      end
      
      describe ".listActiveForums" do
        it "get list of forums users has been active on." do
          stub_get("users/listActiveForums.json", :query => { :user => "1234" }).
            to_return(:body => fixture("users/listActiveForums.json"), :headers => {:content_type => "application/json; charset=utf-8"})
          
          @client.listActiveForums(:user => 1234)
          
          a_get("users/listActiveForums.json", :query => { :user => "1234"}).should have_been_made
        end
      end
      
      describe ".listActiveThreads" do
        pending
      end
      
      describe ".listActivity" do
        pending
      end
      
      describe ".listFollowers" do
        pending
      end
      
      describe ".listFollowing" do
        pending
      end
      
      describe ".listForums" do
        it "get list of users forums." do
          stub_get("users/listForums.json", :query => { :user => "1234" }).
            to_return(:body => fixture("users/listForums.json"), :headers => {:content_type => "application/json; charset=utf-8"})
          
          @client.listForums(:user => 1234)
          
          a_get("users/listForums.json", :query => { :user => "1234"}).should have_been_made
        end
      end
      
      describe "listMostActiveForums" do
        pending
      end
      
      describe ".listPosts" do
        it "get list of users posts." do
          stub_get("users/listPosts.json", :query => { :user => "191921097" }).
            to_return(:body => fixture("users/listPosts.json"), :headers => {:content_type => "application/json; charset=utf-8"})
          
          @client.listPosts(:user => 191921097)
          
          a_get("users/listPosts.json", :query => { :user => "191921097"}).should have_been_made
        end
      end
      
      describe "unfollow" do
        it "get the correct resource" do
          stub_post("users/unfollow.json", :body => { :target => "12345678" }).
            to_return(:body => fixture("users/unfollow.json"), :headers => {:content_type => "application/json; charset=utf-8"})
          
          @client.unfollow(12345678)
          
          a_post("users/unfollow.json", :body => { :target => "12345678"}).should have_been_made
        end
      end
      
    end
  end
end
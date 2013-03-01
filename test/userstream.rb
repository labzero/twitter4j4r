#!/usr/bin/env ruby

require 'settingslogic'
require 'test/unit'
require 'twitter4j4r'

class Settings < Settingslogic
  source "#{File.expand_path('~')}/twitter4j4r_settings.yml"
end

class UserstreamTest < Test::Unit::TestCase

  def setup
    @client = Twitter4j4r::Client.new(:consumer_key => Settings.twitter.consumer_key,
                                      :consumer_secret => Settings.twitter.consumer_secret,
                                      :access_token => Settings.twitter.oauth_token,
                                      :access_secret => Settings.twitter.oauth_token_secret)
  end

  def test_userstream
    p "Starting userstream"

    status_ok = false
    @client.userstream

    @client.on_exception do |exception|
      if exception.to_s.index('(LocalJumpError) break from proc-closure') >= 0
        @client.stop
      else
        assert false, "An error occurred - #{exception.message}"
      end
    end

    @client.on_status do |status|
      @client.stop
      status_ok = true
      assert true, "#{status.user.screen_name} => #{status.text}"
    end

    # assertion loop
    while !status_ok
      if status_ok
        assert status_ok, 'status update received'
      end
      sleep(0.5)
    end

  end

end



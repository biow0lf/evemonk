# frozen_string_literal: true

require "rails_helper"

describe MailsController do
  describe "routing" do
    it "should route GET /characters/90729314/mails to mails#index" do
      expect(get: "/characters/90729314/mails").to route_to(
        controller: "mails",
        action: "index",
        character_id: "90729314"
      )
    end
  end
end

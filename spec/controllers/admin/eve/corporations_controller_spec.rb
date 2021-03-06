# frozen_string_literal: true

require "rails_helper"

describe Admin::Eve::CorporationsController do
  it_behaves_like "disable modification", Eve::Corporation

  it { should be_an(Admin::ApplicationController) }

  it { should be_an(Admin::DisableModifications) }
end

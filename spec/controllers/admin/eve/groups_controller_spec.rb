# frozen_string_literal: true

require "rails_helper"

describe Admin::Eve::GroupsController do
  it_behaves_like "disable modification", Eve::Group

  it { should be_an(Admin::ApplicationController) }

  it { should be_an(Admin::DisableModifications) }
end

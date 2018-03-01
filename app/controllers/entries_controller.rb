class EntriesController < ApplicationController
  before_action :authorize_user?

  def index
    @entries = Entry.all
  end

  def new
    new_entry_path
  end

  private

  def authorize_user?
    if !user_signed_in?
      redirect_to new_user_registration_path
    end
  end

  def random_prompt
    prompts = [
      "List Five things you are grateful for...",
      "What was the last positive thing you were a part of?",
      "Write about the last compliment you received...",
      "My perfect day looks like …",
      "What is a really unique quality you have?",
      "When was the last time you were a badass?",
      "Give yourself a pep talk your best-friend would give you on a bad day?",
      "Name two things you are really good at…",
      "Reframe one negative thing that happened today?",
      "Look back at a bad event in your life and write about a positive consequence of that event..."
    ]
    prompts.sample
  end
end

require 'rails_helper'

feature 'user can see a list of past entries and has the ability to edit past entries' do
  let(:becca) { FactoryBot.create(:user) }

  let!(:prompt1) { Prompt.create!(prompt_content: "Name two things you are really good at...") }
  let!(:prompt2) { Prompt.create!(prompt_content: "What is a really unique quality you have?") }
  let!(:prompt3) { Prompt.create!(prompt_content: "When was the last time you were a badass?") }

  let!(:entry1) { Entry.create!(user: becca, prompt: prompt1, response: "singing and dancing") }
  let!(:entry2) { Entry.create!(user: becca, prompt: prompt2, response: "I am insanely curious") }
  let!(:entry3) { Entry.create!(user: becca, prompt: prompt3, response: "I debugged my own code today") }

  before(:each) do
    sign_in_as(becca)
  end

  scenario 'user can see a list of past entries' do
    # visit user_entries_path(becca)

    expect(page).to have_content('Entries')
    expect(page).to have_content("Name two things you are really good at...")
    expect(page).to have_content("singing and dancing")
    expect(page).to have_content("What is a really unique quality you have?")
    expect(page).to have_content("I am insanely curious")
    expect(page).to have_content("When was the last time you were a badass?")
    expect(page).to have_content("I debugged my own code today")

  end
end

#Entries: id, response,
#Prompt: prompt_content, b._to user, b._to entry

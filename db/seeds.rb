admin = User.find_or_create_by!(email: 'admin@email.com', role: 'admin') do |user|
  user.password = 'password'
end


member = User.find_or_create_by!(email: 'member@email.com', role: 'member') do |user|
  user.password = 'password'
end

prompts = [
  "List Five things you are grateful for...",
  "What was the last positive thing you were a part of?",
  "Write about the last compliment you received...",
  "My perfect day looks like …",
  "Give yourself a pep talk your best-friend would give you on a bad day?",
  "Reframe one negative thing that happened today?",
  "Look back at a bad event in your life and write about a positive consequence of that event..."
]

prompts.each do |prompt|
  Prompt.create!(prompt_content: prompt)
end

prompt1 = Prompt.create!(prompt_content: 'Name two things you are really good at…')
prompt2 = Prompt.create!(prompt_content: 'What is a really unique quality you have?')
prompt3 = Prompt.create!(prompt_content: 'When was the last time you were a badass?')


entry1 = Entry.find_or_create_by!(user: member, prompt: prompt1, response: 'singing and dancing')
entry2 = Entry.find_or_create_by!(user: member, prompt: prompt2, response: 'I am insanely curious.')
entry3 = Entry.find_or_create_by!(user: member, prompt: prompt3, response: 'I debugged my own code today by myself.')

import React, { Component } from 'react';
import _ from 'lodash';
import FormField from '../components/FormTile';

class NewFormContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      formBody: 'Type your response here',
      prompt: ''
    }
    this.handleEntryChange = this.handleEntryChange.bind(this)
    this.handleEntrySubmit = this.handleEntrySubmit.bind(this)
  }

  fetchRandomPrompt() {
    const PROMPTS = [
      "List Five things you are grateful for...",
      "What was the last positive thing you were a part of?",
      "Write about the last compliment you received...",
      "My perfect day looks like …",
      "Give yourself a pep talk your best-friend would give you on a bad day?",
      "Reframe one negative thing that happened today?",
      "Look back at a bad event in your life and write about a positive consequence of that event...",
      'Name two things you are really good at…',
      'What is a really unique quality you have?',
      'When was the last time you were a badass?'
    ]
    this.setState({prompt: _.sample(PROMPTS)})
  }

  handleEntryChange(event){
    this.setState({
    formBody: event.target.value
    })
  }

  addNewEntry(formPayload) {
    fetch(`/api/v1/entries`, {
      credentials: 'same-origin',
      header: {
       'Content-Type': 'application/json',
       'X-Requested-With': 'XMLHttpRequest'
      },
      method: 'POST',
      body: JSON.stringify(formPayload)
    })
    .then(response => response.json())
    .then(body => {
      this.setState({entries: entry.response})
    })
  }

  handleEntrySubmit(event){
    event.preventDefault()
    let formPayload = {
      response: this.state.formBody,
      prompt: this.state.prompt
    }
    console.log(formPayload)
    // this.addNewEntry(formPayload)
  }
  handleClearForm(event){
    event.preventDefault()
    this.setState({
      formBody: ''
    })
  }

  componentWillMount(){
    this.fetchRandomPrompt()
  }

  render() {
    return(
    <div>
      <h1>{this.state.prompt}</h1>
      <form className="new-review-form panel" onSubmit={this.handleEntrySubmit}>
        <fieldset>
          <div className="formFun"></div>
          <FormField
            label='Response'
            content={this.state.formBody}
            handleChange={this.handleEntryChange}
          />
        </fieldset>
        <button type='Submit'>Submit your Entry</button>
      </form>
    </div>
    )
  }
}

export default NewFormContainer;

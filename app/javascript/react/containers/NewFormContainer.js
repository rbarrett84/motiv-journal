import React, { Component } from 'react';
import FormField from '../components/FormTile';

class NewFormContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      formBody: '',
      prompt: {},
      promptText: ""
    }
    this.handleEntryChange = this.handleEntryChange.bind(this)
    this.handleEntrySubmit = this.handleEntrySubmit.bind(this)
  }

  componentDidMount() {
    fetch('/api/v1/entries/new')
      .then(response => {
        if (response.ok){
          return response.json()
        } else {console.log("There is an error with the path")}
      }) .then(body => {
        this.setState({
          prompt: body,
          promptText: body.prompt_content
        })
      })
    }

  handleEntryChange(event){
    this.setState({
    formBody: event.target.value
    })
  }

  addNewEntry(formPayload) {
    fetch('/entries', {
      credentials: 'same-origin',
      header: {
       'Content-Type': 'application/json',
       'X-Requested-With': 'XMLHttpRequest'
      },
      method: 'POST',
      body: JSON.stringify(formPayload)
    })
  }

  handleEntrySubmit(event){
    event.preventDefault()
    let formPayload = {
      response: this.state.formBody,
      prompt: this.state.prompt
    }
    console.log(formPayload)
    this.addNewEntry(formPayload)
  }

  handleClearForm(event){
    event.preventDefault()
    this.setState({
      formBody: ''
    })
  }

  render() {
    return(
    <div>
      <h1>{this.state.promptText}</h1>
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

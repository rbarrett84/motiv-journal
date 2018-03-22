import React from 'react';

const FormField = (props) => {
  return (
    <label >{props.label}
      <textarea
        type='text'
        onChange={props.handleChange}
        value={props.content}
        placeholder = "Type your response"
      />
    </label>
  );
}

export default FormField;

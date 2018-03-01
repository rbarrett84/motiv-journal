import React from 'react';

const FormField = (props) => {
  return (
    <label >{props.label}
      <textarea
        type='text'
        onChange={props.handleChange}
        value={props.content}
      />
    </label>
  );
}

export default FormField;

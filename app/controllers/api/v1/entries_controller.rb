class Api::V1::EntriesController < ApplicationController
  def new
    render json: (random_prompt(Prompt.all))
  end

  private

  def random_prompt(prompts)
    return prompts.sample
  end
end

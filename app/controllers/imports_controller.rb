# frozen_string_literal: true

class ImportsController < ApplicationController
  def new; end

  def create
    result = ImportCreateService.perform(params[:file])

    if result.valid?
      redirect_to new_import_path, notice: 'Importação feita com sucesso!'
    else
      redirect_to new_import_path, notice: result.error
    end
  end
end

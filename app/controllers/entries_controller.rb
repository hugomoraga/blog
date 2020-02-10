class EntriesController < ApplicationController
    before_action :set_entries, only: [:edit, :update, :delete]

    def index
        @entries_open = Entry.where(status: 'en curso')
        @entries_close = Entry.where(status: 'cerrada')
    end

    def new
        @entry = Entry.new
    end 

    def create
        @entry = Entry.new(entry_params)

        if @entry.save
            redirect_to root_path, notice: 'Entrada Guardada owo'
        else
            redirect_to new_entries_path, alert: 'Entrada no Guardada :('
        end
    end

    def edit
    end

    def update
        @entry.update(entry_params)
        if @entry.save
            redirect_to root_path, notice: 'Entrada Guardada owo'
        else
            redirect_to new_entry_path, alert: 'Entrada no Guardada :('
        end
    end
    private
    
    def entry_params
        params.require(:entry).permit(:title, :content, :status)
    end

    def set_entries
        @entry = Entry.find(params[:id])
    end
end
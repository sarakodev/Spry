class ParticipationsController < ApplicationController

    def update
      @participation = Participation.find(params[:id])
      if @participation.update(participation_params)
        redirect_to @participation, notice: "Distance mise à jour avec succès."
      else
        render :show
      end
    end
  
    private
  
    def participation_params
      params.require(:participation).permit(:distance)
    end
end 
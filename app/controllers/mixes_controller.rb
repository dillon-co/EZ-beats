 class MixesController < ApplicationController
  
  def new
    @mix = Mix.new
  end

  def create
    # @new_mix = Mix.find(params[:id])
    # @mix = Mix.create(:id => @new_mix.id)
    # @song = Mix.find(params[:])
    # @songs << @new_mix
    @mix = Mix.create(mix_params)
    parse_songs(@mix)
    if @mix.save
      redirect_to user_path(current_user)
    else
      render :new
    end    
  end  

  private

  def parse_songs(mix)
    binding.pry
    params[:mix].each do |key, value|
        mix.songs << key if value == '1'
    end
  end


  def mix_params
    params.require(:mix).permit(:name, :checked, :songs, :user_id)
  end

end

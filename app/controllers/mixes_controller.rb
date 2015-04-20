 class MixesController < ApplicationController
  
  def new
    @mix = Mix.new
  end

  def create
    @mix = Mix.create(mix_params)
    parse_songs(@mix)
    @mix.save
  end  

  private

  def parse_songs(mix)
    params[:mix].each do |key, value|
      if key[/_sound/]
        mix.songs << key if value
      end
    end
  end


  def mix_params
    params.require(:mix).permit(:name, :checked)
  end

end

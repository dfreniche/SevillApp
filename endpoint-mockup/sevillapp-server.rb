#MIT License
#Diego Freniche 2012

#sevillapp-server.rb
#Mockup server: used to simulate a real API returning JSON data
#it does return JSON data, but always the same data.
#No database, no nothing. Just mocking, no big deal

require 'sinatra'
require 'json'


# Making a Sinatra app respect UTF-8:
#
# 1.  At the top of your app file, set $KCODE to 'u'.
#     This ensures your regexps are in UTF-8 mode by default,
#     and #inspect will output UTF-8 chracters correctly.
#     This option is on by default as of Ruby 1.9.
#     For more information on the $KCODE setting, see:
#     http://blog.grayproductions.net/articles/the_kcode_variable_and_jcode_library

$KCODE = 'u' if RUBY_VERSION < '1.9'
 
# 2.  Set content-type with charset=utf-8 param (not the default setting.)
#     This ensures the browser will render utf-8 characters correctly.
#     A before filter is a good place to do this:

before do
  content_type :json, 'charset' => 'utf-8'
end

get '/helloworld' do
    "Hello World!"
    
end

get '/route' do
    sleep 10
    content_type :json

    if params[:locale] == 'ES_es'
        erb :hello
    elsif params[:locale] == 'EN'
        { :id => 01, :name => 'Ruta histórica' }.to_json
    else
        { :id => 345, :key2 => 'Grijander del nirmolen!' }.to_json
    end

    
end


get '/poidetail' do
    content_type :json
    { :id => 01, :name => 'Ruta histórica', :description => 'Some desc in Spanish', :latitude => 10.09, :longitude => 20.09, :address => 'Parellel, 10', :order => 10, :tags => ['tag1', 'tag2'] }.to_json
end



__END__
@@ layout

<%= yield %>

@@ hello
[{"id":0,"shortDescription":"","description":"","thumbImageName":"giralda.png","longitude":"-5.992396","tags":["Monumento"],"latitude":"37.386303","url":"http:\/\/es.wikipedia.org\/wiki\/Giralda","address":"","photos":[],"pinIconName":"","videos":[],"name":"La Giralda"},{"id":0,"shortDescription":"","description":"","thumbImageName":"torredeloro.png","longitude":"-5.992396","tags":["Monumento"],"latitude":"37.386303","url":"http:\/\/es.wikipedia.org\/wiki\/Giralda","address":"","photos":[],"pinIconName":"","videos":[],"name":"Torre del Oro"},{"id":0,"shortDescription":"","description":"","thumbImageName":"alcazares.png","longitude":"-5.992275","tags":["Monumento"],"latitude":"37.384404","url":"http:\/\/es.wikipedia.org\/wiki\/Giralda","address":"41004 Sevilla","photos":[],"pinIconName":"","videos":[],"name":"Reales alcázares"},{"id":0,"shortDescription":"","description":"","thumbImageName":"jardines_murillo.png","longitude":"-5.987624","tags":["Monumento"],"latitude":"37.383257","url":"http:\/\/es.wikipedia.org\/wiki\/Giralda","address":"Av de Menéndez Pelayo, 6","photos":[],"pinIconName":"","videos":[],"name":"Jardines de Murillo"},{"id":0,"shortDescription":"","description":"","thumbImageName":"jardines_murillo.png","longitude":"-5.993428","tags":["Monumento"],"latitude":"37.384685","url":"http:\/\/es.wikipedia.org\/wiki\/Giralda","address":"Av de Menéndez Pelayo, 6","photos":[],"pinIconName":"","videos":[],"name":"Archivo de Indias"},{"id":0,"shortDescription":"","description":"","thumbImageName":"maestranza.png","longitude":"-5.999018","tags":["Monumento"],"latitude":"37.385563","url":"http:\/\/realmaestranza.com","address":"Paseo de Cristóbal Colón, 12","photos":[],"pinIconName":"","videos":[],"name":"Plaza de toros La Maestranza"},{"id":0,"shortDescription":"Su nombre se debe a que cuando llegaba algún rey, honrando su recibimiento se colocaban banderas en dicho lugar, aunque también puede ser debido a unas banderas ondeando al viento que en otros tiempos estaban pintadas al fresco sobre la puerta de acceso existente en la Plaza del Triunfo.","description":"El Patio de Banderas, con forma de antiguo patio de vecinos, está ubicado dentro del entorno de los Reales Alcázares de Sevilla, se puede considerar plaza por sus dimensiones, ya que tiene una extensión de 1441 m². Es un lugar de paso permitiendo el acceso tanto a la Plaza del Triunfo como al Barrio de Santa Cruz (antes judería), a través del callejón de la Judería, siempre que se acceda al mismo desde la salida que tiene el Alcázar a través del apeadero (amplio zaguán utilizado como parada de carruajes y automóviles) hacia el patio. Está cercado por las altas murallas del Alcázar.","thumbImageName":"Patio_de_Banderas.png","longitude":"-5.991046","tags":["Monumento"],"latitude":"37.384493","url":"http:\/\/es.wikipedia.org\/wiki\/Patio_de_Banderas","address":"Plaza Patio de Banderas, 11","photos":[],"pinIconName":"","videos":[],"name":"Patio de Banderas"}]
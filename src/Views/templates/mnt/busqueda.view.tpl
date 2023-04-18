<section class="ContenedorSeccionSeparador">
    <p>{{Titulo}}</p>
</section>

<input type="hidden" name="mode" value="{{mode}}" />
<input type="hidden" name="Busqueda" value="{{Busqueda}}" />

<section class="ContenedorDeBusqueda">       
    
    {{foreach LibrosEncontrados}}    
     <div class="boxPopsAniBus">
             <div class="img256" style="background-image: url({{Imagen64}})"></div>

            <button class="btnAdd" role="button" onclick="Agregar( '{{Titulo}}',{{ID}})"><span
                    class="text">pay</span><span>Comprar</span></button>
            <button class="btnAdd" role="button"
                onclick="OpenModal('{{Titulo}}', '{{Contenido}}', '{{Autor}}', '{{Genero}}', '{{Idioma}}', '{{Fecha}}', '{{Precio}}', {{ID}})"><span
                    class="text">Info</span><span>Detalles</span></button>
        </div>
    {{endfor LibrosEncontrados}}
    
</section>
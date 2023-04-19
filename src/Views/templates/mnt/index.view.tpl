<section class="ContenedorPrincipalPortada2 Animado">
    <div class="imgPortada2"></div>
    <div class="ContenidoPortada">
        <div class="boxPops">
            <div class="imgGeneros"></div>
        </div>
    </div>
    <div class="ContenidoPortada2">
        <p>Una colección de temporada</p>
        <p>Explora todos los Generos al alcance de un click</p>
        <h1>Generos Literarios </h1>
        <input type="button" value="Todos los libros" onclick="Explorar()" >
    </div>
</section>

<section class="ContenedorSeccionSeparador">    
</section>

<section class="ContenedorPrincipalPortada3 Animado">
    <div class="imgPortada3"></div>

    <div class="ContenidoPortada4">
        <h1>Mundo Manga</h1>
        <p>漫画世界</p>
        <input type="button" id="btnManga" onclick="Seccion3()" value="Descubrir Más">
        
    </div>

    <div class="ContenidoLibs">
        {{foreach LibrosMangas2}}
        <div class="boxPopsAni">
            
            <div class="img256" style="background-image: url({{Imagen64}})"></div>            

            <button class="btnAdd2" role="button" ><span
                    class="text">Comprar</span><span>Comprar</span></button>
            <button class="btnAdd2" role="button"
                onclick="OpenModal('{{Titulo}}', '{{Contenido}}', '{{Autor}}', '{{Genero}}', '{{Idioma}}', '{{Fecha}}', '{{Precio}}', {{ID}})"><span
                    class="text">Info</span><span>Detalles</span></button>  
        </div>
        {{endfor LibrosMangas2}}
    </div>

    <div class="ContenidoPortadaLib">
        {{foreach LibrosMangas}}
        <div class="boxPopsAni">
            <div class="img256" style="background-image: url({{Imagen64}})"></div>

            <button class="btnAdd2" role="button" onclick="Agregar( '{{Titulo}}',{{ID}})"><span
                    class="text">pay</span><span>Comprar</span></button>
            <button class="btnAdd2" role="button"
                onclick="OpenModal('{{Titulo}}', '{{Contenido}}', '{{Autor}}', '{{Genero}}', '{{Idioma}}', '{{Fecha}}', '{{Precio}}', {{ID}})"><span
                    class="text">Info</span><span>Detalles</span></button>
        </div>
        {{endfor LibrosMangas}}
    </div>
</section>


<section class="ContenedorBooks">
    {{foreach LibrosRecientes}}
    <div class="box Animado">
        <img class="img255" src="{{Imagen64}}" alt="">
        <button class="btnAdd" role="button" onclick="Agregar( '{{Titulo}}',{{ID}})"><span
                class="text">pay</span><span>Comprar</span></button>        
        <button class="btnAdd" role="button"
            onclick="OpenModal('{{Titulo}}', '{{Contenido}}', '{{Autor}}', '{{Genero}}', '{{Idioma}}', '{{Fecha}}', '{{Precio}}', {{ID}})"><span
                class="text">Info</span><span>Detalles</span></button>
    </div>
    {{endfor LibrosRecientes}}
</section>

<section class="ContenedorSeccionSeparador">
    
</section>

<section class="ContenedorPrincipalBoxes Animado">
    {{foreach LibrosPopulares}}
    <div class="CajaA1">
        <img class="imgCA" src="{{Imagen64}}" alt="Portada Imagen">
        <div class="GeneroLibro">
            <p></p>
        </div>
        <div class="PequenaInfo">
            <p></p>
        </div>
        <div class="ContenedorBotonCajaA1">
            <button class="btnAdd" role="button" onclick="Agregar( '{{Titulo}}',{{ID}})"><span
                    class="text">pay</span><span>Comprar</span></button>            
            <button class="btnAdd" role="button"
                onclick="OpenModal('{{Titulo}}', '{{Contenido}}', '{{Autor}}', '{{Genero}}', '{{Idioma}}', '{{Fecha}}', '{{Precio}}', {{ID}})"><span
                    class="text">Info</span><span>Detalles</span></button>
        </div>
    </div>
    {{endfor LibrosPopulares}}
</section>

<section class="ContenedorSeccionSeparador">    
</section>

{{foreach LibrosPublicidad2}}
<section class="ContenedorVista Animado">
    <div class="Fondo">
        <img src="{{Imagen64}}" class="imgContenedorVista" alt="">
        <div class="Titulo">
            <h1>{{Titulo}}</h1>
            <h3>{{Autor}}</h3>
        </div>
        <div class="InformacionPublicidad">
            <div class="Informacion">
                <h1>O</h1>
                <p>{{Contenido}}</p>
            </div>

            <div class="Continuar">
                <button class="btnAdd2" role="button" onclick="Agregar( '{{Titulo}}',{{ID}})"><span
                        class="text">pay</span><span>Comprar</span></button>                
            </div>
        </div>
    </div>
</section>
{{endfor LibrosPublicidad2}}




<section class="ContenedorPrincipalPortada">
    <div class="imgPortada"></div>
    <p>«Quizás ningún lugar en cualquier comunidad es tan totalmente democrático como la biblioteca de la ciudad.</p>
    <p>El único requisito de entrada es el interés»</p>
    <h1>Una biblioteca es una casa de amigos</h1>    
</section>


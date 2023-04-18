<section class="ContenedorBotonesSeccion">
    <div class="TituloSeccion">
        <span>Generos Literarios</span>
    </div>
    <div class="BoxSeccion">
        <input type="button" class="btnInvestigar" onclick="Seccion4('Poesia')" id="Btn1" value="Poesía">
        <input type="button" class="btnInvestigar" onclick="Seccion4('No-Ficcion')" id="Btn2" value="No-Ficcion">        
        <div class="Arrow">
            <svg xmlns="http://www.w3.org/2000/svg" id="ArrowDown" height="48" width="48">
                <path d="M24 40 8 24l2.1-2.1 12.4 12.4V8h3v26.3l12.4-12.4L40 24Z" />
            </svg>
            <p id="txtSeccion"></p>
        </div>
        <input type="button" class="btnInvestigar" onclick="Seccion4('Terror')" id="Btn4" value="Terror">
        <input type="button" class="btnInvestigar" onclick="Seccion4('Comics')" id="Btn5" value="Comics">        
    </div>
</section>

<section class="ContenedorOpen Animado">
    {{foreach GenerosLiterarios}}
    <div class="imgPortada5"></div>
    <div class="boxLibs">
        <div class="imgLib" style="background-image: url({{Imagen64}})"></div>
        <div class="Contenido">
            <h1 id="TituloLib">{{Titulo}}</h1>

            <button class="btnAdd" role="button" onclick="Agregar( '{{Titulo}}',{{ID}})"><span
                    class="text">$</span><span>Comprar</span></button>
            <button class="btnAdd" role="button"
                onclick="OpenModal('{{Titulo}}', '{{Contenido}}', '{{Autor}}', '{{Genero}}', '{{Idioma}}', '{{Fecha}}', '{{Precio}}', {{ID}})"><span
                    class="text">🟑</span><span>Detalles</span></button>
        </div>
    </div>
    {{endfor GenerosLiterarios}}    
</section>
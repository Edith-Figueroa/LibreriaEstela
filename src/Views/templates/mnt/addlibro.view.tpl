<section class="CajaProducto">
  <h4>{{mode_desc}}</h4>

  <form action="index.php?page=mnt_addlibro" method="post" enctype="multipart/form-data">
    <input type="hidden" name="mode" value="{{mode}}" />
    <input type="hidden" name="crsf_token" value="{{crsf_token}}" />
    <input type="hidden" name="ID" value="{{ID}}" />

    <div class="Box1">
      <label for="Titulo">Titulo</label>
      <input type="text" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="Titulo" id="Titulo"
        value="{{Titulo}}" />
      {{if error_Titulo}}
      {{foreach error_Titulo}}
      <div class="error">{{this}}</div>
      {{endfor error_Titulo}}
      {{endif error_Titulo}}

      <label for="Autor">Autor</label>
      <input type="text" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="Autor" id="Autor"
        value="{{Autor}}" />
      {{if error_Autor}}
      {{foreach error_Autor}}
      <div class="error">{{this}}</div>
      {{endfor error_Autor}}
      {{endif error_Autor}}


      <label for="Genero">Genero</label>
      <input type="text" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="Genero" id="Genero"
        value="{{Genero}}" />
      {{if error_Genero}}
      {{foreach error_Genero}}
      <div class="error">{{this}}</div>
      {{endfor error_Genero}}
      {{endif error_Genero}}


      <label for="Idioma">Idioma</label>
      <input type="text" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="Idioma" id="Idioma"
        value="{{Idioma}}" />
      {{if error_Idioma}}
      {{foreach error_Idioma}}
      <div class="error">{{this}}</div>
      {{endfor error_Idioma}}
      {{endif error_Idioma}}


      <label for="Precio">Precio</label>
      <input type="text" class="txtID" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="Precio"
        id="Precio" value="{{Precio}}" />
      {{if error_Precio}}
      {{foreach error_Precio}}
      <div class="error">{{this}}</div>
      {{endfor error_Precio}}
      {{endif error_Precio}}


      <label for="Fecha">Fecha</label>
      <input type="date" autocomplete="off" {{if readonly}} readonly {{endif readonly}} name="Fecha" id="Fecha"
        value="{{Fecha}}" />
      {{if error_Fecha}}
      {{foreach error_Fecha}}
      <div class="error">{{this}}</div>
      {{endfor error_Fecha}}
      {{endif error_Fecha}}

    </div>

    <div class="Box2">
      <label for="Contenido">Contenido</label>
      <textarea name="Contenido" id="Contenido" {{if readonly}} readonly {{endif readonly}}cols="30"
        rows="30">{{Contenido}}</textarea>
      {{if error_Contenido}}
      {{foreach error_Contenido}}
      <div class="error">{{this}}</div>
      {{endfor error_Contenido}}
      {{endif error_Contenido}}

      <label for="chkMostrar">Segunda Imagen</label>

      <input type="checkbox" {{if readonly}} disabled {{endif readonly}} name="chkMostrar" id="chkMostrar"
        onclick="MostrarSegundaImagen()">

      <input type="file" name="image2" id="image2" class="pickerImg2">

      <label for="Contenido" class="chkPublicidad">Mejorar Publicidad</label>
      <input type="checkbox" class="chkPublicidad" name="chkPublicidad" id="chkPublicidad" value="NOACT"
        onclick="PublicidadExtra()">

      <label for="Contenido">Portada</label>
      <input type="file" required {{if readonly}} disabled {{endif readonly}} name="image" id="image"
        class="pickerImg" />
    </div>

    <fieldset>
      {{if showBtn}}
      <button class="btnEnviar" type="submit" name="btnEnviar">{{btnEnviarText}}</button>
      &nbsp;
      {{endif showBtn}}
      <button class="btnCancelar" name="btnCancelar" id="btnCancelar">Cancelar</button>
    </fieldset>
  </form>
</section>

<script>
  document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('btnCancelar').addEventListener('click', function (e) {
      e.preventDefault();
      e.stopPropagation();
      window.location.href = 'index.php?page=mnt_libros';
    });
  });
</script>
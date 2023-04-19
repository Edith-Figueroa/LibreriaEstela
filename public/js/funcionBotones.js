const style = document.documentElement.style;
let MSJAni = document.querySelector('#Msj');

//Redireccionamientos
function Add() {
    location.href = "index.php?page=Mnt-addlibro&mode=INS";
}

function Edit(ID) {
    location.href = "index.php?page=Mnt-addlibro&mode=UPD&id=" + ID;
}

function Historial(ID) {
    location.href = "index.php?page=Mnt-historial&id=" + ID;
}

function Delete(ID) {
    location.href = "index.php?page=Mnt-addlibro&mode=DEL&id=" + ID;
}

function AddRol(ID, Rol) {
    location.href = "index.php?page=Mnt_usuario&mode=ADD&Rol="+ Rol +"&id=" + ID;
}

function DelRol(ID, Rol) {
    location.href = "index.php?page=Mnt_usuario&mode=DEL&Rol="+ Rol +"&id=" + ID;
}


function AddFun(Rol, Fncod, ID) {
    console.log(Fncod);    
    location.href = "index.php?page=Mnt_rol&mode=ADD&Fncod="+ Fncod +"&Rol=" + Rol +"&id=" + ID;
}

function DelFun(Rol, Fncod, ID) {
    location.href = "index.php?page=Mnt_rol&mode=DEL&Fncod="+ Fncod +"&Rol=" + Rol +"&id=" + ID;
}

function Pasarela() {
    location.href = "index.php?page=mnt-pasarela";
}


function DeletePasarela(ID) {
    location.href = "index.php?page=Mnt-pasarela&mode=DEL&id=" + ID;
}

function RealizarPedido(ID) {
    location.href = "index.php?page=Mnt-pasarela&mode=ADD&id=" + ID;
}

function MisLibros() {
    location.href = "index.php?page=mnt-mislibros";
}

function Explorar() {
    location.href = "index.php?page=Mnt-busqueda&mode=ALL";
}

function Registro(){
    location.href = "index.php?page=sec_register";
}

function Visuzalizar(ID){
    location.href = "index.php?page=Mnt-visualizar&Libro=" + ID;
}

function IrAtras(){
    location.href = "javascript:history.go(-1)";
}

function SearchLibro() {
    location.href = "index.php?page=Mnt-busqueda&mode=DSP&Busqueda=" + document.getElementById('txtSearch').value;
}

document.getElementById('txtSearch').addEventListener('keyup', SearchLibroEnter);

function SearchLibroEnter() {
    if (event.keyCode == 13) {
        location.href = "index.php?page=Mnt-busqueda&mode=DSP&Busqueda=" + document.getElementById('txtSearch').value;
    }
}

// document.getElementById('txtID').addEventListener('keydown', SearchAddLibros);

function SearchAddLibros() {
    
        location.href = "index.php?page=Mnt-libros&mode=DSP&Busqueda=" + document.getElementById('txtID').value;
    
}

function BusquedaAutor(ID) {
    if (ID == 1) {
        location.href = "index.php?page=Mnt-busqueda&mode=DSP&Busqueda=" + document.getElementById('txtAutor').innerHTML;
    } else {
        location.href = "index.php?page=Mnt-busqueda&mode=DSP&Busqueda=" + document.getElementById('txtAutor2').innerHTML;
    }

}

function BusquedaGenero(ID) {
    if (ID == 1) {
        location.href = "index.php?page=Mnt-busqueda&mode=DSP&Busqueda=" + document.getElementById('txtGenero').innerHTML;
    } else {
        location.href = "index.php?page=Mnt-busqueda&mode=DSP&Busqueda=" + document.getElementById('txtGenero2').innerHTML;
    }
}


//Checkbox De Publicidad Extra
const chkPubli = document.getElementById('chkPublicidad');
const chkMostrar = document.getElementById('chkMostrar');
var ToqueChk = 0;
var ToqueChk2 = 0;

function MostrarSegundaImagen() {
    chkMostrar.checked = true;
    ToqueChk++;
    if (chkMostrar.checked == true && ToqueChk == 1) {
        chkMostrar.checked = true;
        chkMostrar.value = 'NOACT';
        console.log(chkMostrar.value);
        style.setProperty('--VisibilidadImg2', 'visible');
    } else {
        chkMostrar.value = 'ACT';
        console.log(chkMostrar.value);
        chkMostrar.checked = false;
        style.setProperty('--VisibilidadImg2', 'hidden');
        ToqueChk = 0;
    }
}

function PublicidadExtra() {
    chkPubli.checked = true;
    ToqueChk2++;
    if (chkPubli.checked == true && ToqueChk2 == 1) {
        chkPubli.value = 'ACT';
        chkPubli.checked = true;
    } else {
        chkPubli.value = 'NOACT';
        chkPubli.checked = false;
        ToqueChk2 = 0;
    }
}

function Generos() {
    MSJ('Explorando Generos Literarios');
    MoverTotal();
}

function ReplaceEnters(texto) {
    texto = texto.replace(/\r?\n/g, "<br>");
    return texto;
}

function CambiarHTML(Tipo, NameId, msj) {
    if (Tipo == 1) {
        document.getElementById(NameId).value = msj;
    } else {
        document.getElementById(NameId).innerHTML = msj;
    }
}

function Rgb(MetodoPago) {
    if (MetodoPago == 1) {
        MSJ('a través de Paypal');
    }
    else if (MetodoPago == 2) {
        MSJ('a través de PyxelPay');
    }
}

//Animaciones de funciones 

function Seccion3() {
    Seccion3Toque++;
    if (Seccion3Toque == 1) {
        style.setProperty('--Seccion3', '1200px');
        style.setProperty('--Seccion32', '700px'); //heigth de ContenedorLibs
        CambiarHTML(1, 'btnManga', 'Mostrar Tops');
        MSJ('Descubriendo Más Manga');
    } else {
        style.setProperty('--Seccion3', '0px');
        style.setProperty('--Seccion32', '0px'); //heigth de ContenedorLibs
        CambiarHTML(1, 'btnManga', 'Descubrir Más');
        Seccion3Toque = 0;
        MSJ('Top Manga');
    }
}

function Seccion4(txtBotonSeleccionado) {
    style.setProperty('--heigthOpen', '800px');
    style.setProperty('--widthOpen', '123.2%');
    style.setProperty('--Arrow', '0px');
    MSJ('Desplace hacía abajo');
    document.getElementById('txtSeccion').innerHTML = txtBotonSeleccionado;
    Secciones(txtBotonSeleccionado);
}

//Variables
var Cantidad = 0;
var CantFavoritos = 0;
var BotonToque = 0;
var SeccionToque = 0;
var Seccion3Toque = 0;


function Agregar(libro, ID) {
    Cantidad++;
    MSJ('Agregando ' + libro + ' a la compra');
    setTimeout(function () {
        RedireccionarCompra(ID);
    }, 2000);
}

function RedireccionarCompra(ID) {
    location.href = 'index.php?page=mnt-compra&mode=Compra&id=' + ID;
}

function Favoritos(Libro) {
    CantFavoritos++;
    CambiarHTML(0, 'FavoritaCantidad', CantFavoritos);
    MSJ('Agregado a Favoritos ' + Libro);
}

function OpenModal(Titulo, Contenido, Autor, Genero, Idioma, Publicacion, Precio, ID) {
    MSJ('Detalle De ' + Titulo);
    style.setProperty('--MSJModal', '100px');
    CambiarHTML(0, 'txtTitulo', Titulo);
    CambiarHTML(0, 'txtAutor', Autor);
    CambiarHTML(0, 'txtGenero', Genero);
    CambiarHTML(0, 'txtIdioma', Idioma);
    CambiarHTML(0, 'txtPublicacion', Publicacion);
    CambiarHTML(0, 'txtPrecio', Precio + '.00 lps');
    CambiarHTML(0, 'txtContenido', Contenido);
    CambiarHTML(1, 'btnAddID', ID);
    CambiarHTML(1, 'btnFavorite', ID);

}

document.getElementById('btnAddID').onclick = function () {
    var ID = document.getElementById('btnAddID').value;
    var Titulo = document.getElementById('txtTitulo').innerHTML;
    Agregar(Titulo, ID);
}

document.getElementById('btnFavorite').onclick = function () {
    var ID = document.getElementById('btnFavorite').value;
    Favoritos(ID);
    // MSJ('Favorito ID: ' + document.getElementById('btnFavorite').value);
}

function MSJ(msj) {
    style.setProperty('--MSJHeader', '0px');
    document.getElementById('Msj').innerHTML = msj;    
    setTimeout(OcultarMSJ, 3000);
}

function OcultarModal() {
    style.setProperty('--MSJModal', '-600px');
}

function OcultarMSJ() {
    style.setProperty('--MSJHeader', '-100px');
}

function InvestigarManga() {
    style.setProperty('--Seccion321', '121.5%');
}

function Secciones(Seccion) {
    switch (Seccion) {
        case "Poesia":
            style.setProperty('--BackURL', 'url(..//imgs/PortadaPoesia.jpeg)');
            break;
        case "Comics":
            style.setProperty('--BackURL', 'url(..//imgs/PortadaComics.jpeg)');
            break;
        case "No-Ficcion":
            style.setProperty('--BackURL', 'url(..//imgs/PortadaNoFiccion.jpeg)');
            break;
        case "Terror":
            style.setProperty('--BackURL', 'url(..//imgs/PortadaTerror.jpeg)');
            break;
        case "Drama":
            style.setProperty('--BackURL', 'url(..//imgs/PortadaDrama.jpeg)');
            break;
        case "Manga":
            style.setProperty('--BackURL', 'url(..//imgs/PortadaManga.jpeg)');
            break;
    }
}

// function MostrarBienvenida(){
//     const a = 1;
//     if(a == 1){
//         MSJ("Bienvenida")
//     }
// }

// window.onload = MostrarBienvenida();


function MoverTotal() {
    window.scrollTo({
        top: window.innerHeight + 200000,
        behavior: "smooth"
    });
}

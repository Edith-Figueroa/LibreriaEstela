let animado = document.querySelectorAll('.Animado');
// const style = document.documentElement.style;
var Toques = 0;


function mostrarScroll(){
    let scrollTop = document.documentElement.scrollTop;
    for(var i = 0; i<animado.length; i++){
        let AlturaAnimado = animado[i].offsetTop;
        if(AlturaAnimado -400 < scrollTop){
            animado[i].style.opacity = 1;
            animado[i].classList.add("mostrarArriba");
        }
    }
}

window.addEventListener('scroll', mostrarScroll);

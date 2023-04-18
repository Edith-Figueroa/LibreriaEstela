
var toques = 0;

// const style = document.documentElement.style;

function Abrir(){    
    toques ++; 
    if(toques == 1){
        style.setProperty('--Translate', '-20%');
        style.setProperty('--TranslateContent', '10%');
        style.setProperty('--Rotate', '90deg');
    }else if(toques == 2){
        style.setProperty('--Translate', '-80%');
        style.setProperty('--TranslateContent', '0%');
        style.setProperty('--Rotate', '00deg');
        toques = 0;
    }
}
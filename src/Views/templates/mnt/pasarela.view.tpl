<section class="ContenedorCompras">
    <div class="Caja1">    
        {{ifnot Cantidad}}
            <h4 style="color: black; margin-left: 5%;">No ha seleccionado ningun libro</h4>
        {{endifnot Cantidad}}    
    </div>
    <div class="Caja2">
            <a href="index.php?page=mnt-index">Seguir Comprando</a>
            <svg xmlns="http://www.w3.org/2000/svg" height="24" width="24" style="margin-right: 5%;"
                onclick="location.href='index.php?page=mnt-index'">
                <path d="m12 10-1.4-1.4L12.175 7H8V5h4.175l-1.6-1.6L12 2l4 4ZM7 22q-.825 0-1.412-.587Q5 20.825 5 20q0-.825.588-1.413Q6.175 18 7 18t1.412.587Q9 19.175 9 20q0 .825-.588 1.413Q7.825 22 7 22Zm10 0q-.825 0-1.412-.587Q15 20.825 15 20q0-.825.588-1.413Q16.175 18 17 18t1.413.587Q19 19.175 19 20q0 .825-.587 1.413Q17.825 22 17 22ZM1 4V2h3.275l4.25 9h7l3.9-7H21.7l-4.4 7.95q-.275.5-.738.775Q16.1 13 15.55 13H8.1L7 15h12v2H7q-1.125 0-1.713-.975-.587-.975-.037-1.975L6.6 11.6 3 4Z" />
            </svg>
        </div>
</section>

{{if Cantidad}}
<section class="Detalle">
    <div class="BoxSvg">
        <p>Libros en carrito</p>
        <svg xmlns="http://www.w3.org/2000/svg" onclick="MoverTotal()" height="40" width="40">
            <path d="M20 33.333 6.667 20l1.958-1.958 10 10V6.667h2.75v21.375l10-10L33.333 20Z" />
        </svg>
    </div>

    {{foreach CargarCarrito}}
    <div class="BoxDetalle">        
        <div class="BoxInformacion">
            <div class="Cajita">
                <svg xmlns="http://www.w3.org/2000/svg" height="24" width="24">
                    <path d="M10.5 20V7H5V4h14v3h-5.5v13Z" />
                </svg>
                <h3>Titulo</h3>
                <p>{{Titulo}}</p>
            </div>

            <div class="Cajita">
                <svg xmlns="http://www.w3.org/2000/svg" height="24" width="24">
                    <path d="M12 12q-1.65 0-2.825-1.175Q8 9.65 8 8q0-1.65 1.175-2.825Q10.35 4 12 4q1.65 0 2.825 1.175Q16 6.35 16 8q0 1.65-1.175 2.825Q13.65 12 12 12Zm-8 8v-2.8q0-.85.438-1.563.437-.712 1.162-1.087 1.55-.775 3.15-1.163Q10.35 13 12 13t3.25.387q1.6.388 3.15 1.163.725.375 1.162 1.087Q20 16.35 20 17.2V20Zm2-2h12v-.8q0-.275-.137-.5-.138-.225-.363-.35-1.35-.675-2.725-1.013Q13.4 15 12 15t-2.775.337Q7.85 15.675 6.5 16.35q-.225.125-.362.35-.138.225-.138.5Zm6-8q.825 0 1.413-.588Q14 8.825 14 8t-.587-1.412Q12.825 6 12 6q-.825 0-1.412.588Q10 7.175 10 8t.588 1.412Q11.175 10 12 10Zm0-2Zm0 10Z" />
                </svg>
                <h3>Autor</h3>
                <p>{{Autor}}</p>
            </div>            


            <div class="Cajita">
                <svg xmlns="http://www.w3.org/2000/svg" height="24" width="24">
                    <path d="M14 13q-1.25 0-2.125-.875T11 10q0-1.25.875-2.125T14 7q1.25 0 2.125.875T17 10q0 1.25-.875 2.125T14 13Zm-7 3q-.825 0-1.412-.588Q5 14.825 5 14V6q0-.825.588-1.412Q6.175 4 7 4h14q.825 0 1.413.588Q23 5.175 23 6v8q0 .825-.587 1.412Q21.825 16 21 16Zm2-2h10q0-.825.587-1.413Q20.175 12 21 12V8q-.825 0-1.413-.588Q19 6.825 19 6H9q0 .825-.588 1.412Q7.825 8 7 8v4q.825 0 1.412.587Q9 13.175 9 14Zm11 6H3q-.825 0-1.412-.587Q1 18.825 1 18V7h2v11h17ZM7 14V6v8Z" />
                </svg>
                <h3>Precio</h3>
                <p>{{Precio}}</p>
            </div>

            <div class="Cajita">
                <svg xmlns="http://www.w3.org/2000/svg" height="24" width="24">
                    <path d="M5 22q-.825 0-1.413-.587Q3 20.825 3 20V6q0-.825.587-1.412Q4.175 4 5 4h1V2h2v2h8V2h2v2h1q.825 0 1.413.588Q21 5.175 21 6v14q0 .825-.587 1.413Q19.825 22 19 22Zm0-2h14V10H5v10ZM5 8h14V6H5Zm0 0V6v2Zm7 6q-.425 0-.712-.288Q11 13.425 11 13t.288-.713Q11.575 12 12 12t.713.287Q13 12.575 13 13t-.287.712Q12.425 14 12 14Zm-4 0q-.425 0-.713-.288Q7 13.425 7 13t.287-.713Q7.575 12 8 12t.713.287Q9 12.575 9 13t-.287.712Q8.425 14 8 14Zm8 0q-.425 0-.712-.288Q15 13.425 15 13t.288-.713Q15.575 12 16 12t.712.287Q17 12.575 17 13t-.288.712Q16.425 14 16 14Zm-4 4q-.425 0-.712-.288Q11 17.425 11 17t.288-.712Q11.575 16 12 16t.713.288Q13 16.575 13 17t-.287.712Q12.425 18 12 18Zm-4 0q-.425 0-.713-.288Q7 17.425 7 17t.287-.712Q7.575 16 8 16t.713.288Q9 16.575 9 17t-.287.712Q8.425 18 8 18Zm8 0q-.425 0-.712-.288Q15 17.425 15 17t.288-.712Q15.575 16 16 16t.712.288Q17 16.575 17 17t-.288.712Q16.425 18 16 18Z" />
                </svg>
                <h3>Publicación</h3>
                <p id="txtPublicacion">{{Fecha}}</p>
            </div>
        </div>

        <div class="OpcionesBox">
            <label for="eliminar">Cancelar</label>
            <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" id="Trash" onclick="DeletePasarela({{ID}})">
                <path d="M26.583 21.333h-1l-2.75-2.791h3.334l5.041-9.084H13.667l-2.75-2.791h21.958q1.042 0 1.563.875.52.875-.063 1.875L28.5 20.083q-.333.584-.812.917-.48.333-1.105.333ZM11.875 36.625q-1.292 0-2.208-.917-.917-.916-.917-2.166 0-1.292.917-2.209.916-.916 2.208-.916 1.292 0 2.187.916.896.917.896 2.209 0 1.291-.916 2.187-.917.896-2.167.896Zm23.167 2L24.375 28.083H11.917q-1.667 0-2.479-1.291-.813-1.292-.021-2.75l2.541-4.417-3.416-7.458-6.875-6.875 1.958-2L37 36.667ZM21.625 25.292l-3.917-4h-3.5l-2.333 4Zm4.542-6.75h-3.334 3.334Zm2.375 18.083q-1.25 0-2.167-.917-.917-.916-.917-2.166 0-1.292.917-2.209.917-.916 2.167-.916 1.291 0 2.208.916.917.917.917 2.209 0 1.291-.917 2.187-.917.896-2.208.896Z" />
            </svg>
        </div>
        <div class="imgDetalle" style="background-image: url({{Imagen64}});"></div>
    </div>    
    {{endfor CargarCarrito}}


    {{if Loggeado}}
    <div class="BoxTotal">
        <div class="Box1Total">
            <p>Total</p>
        </div>
        <div class="Box2Total">
            {{foreach CargarTotal}}
            <p>{{Total}}.lps</p>
            {{endfor CargarTotal}}
        </div>
    </div>
    <div class="opciones">
        <h2>Información de pago</h2>
        <svg xmlns="http://www.w3.org/2000/svg" height="24" width="24">
            <pat
                d="M14 13q-1.25 0-2.125-.875T11 10q0-1.25.875-2.125T14 7q1.25 0 2.125.875T17 10q0 1.25-.875 2.125T14 13Zm-7 3q-.825 0-1.412-.588Q5 14.825 5 14V6q0-.825.588-1.412Q6.175 4 7 4h14q.825 0 1.413.588Q23 5.175 23 6v8q0 .825-.587 1.412Q21.825 16 21 16Zm2-2h10q0-.825.587-1.413Q20.175 12 21 12V8q-.825 0-1.413-.588Q19 6.825 19 6H9q0 .825-.588 1.412Q7.825 8 7 8v4q.825 0 1.412.587Q9 13.175 9 14Zm11 6H3q-.825 0-1.412-.587Q1 18.825 1 18V7h2v11h17ZM7 14V6v8Z" />
        </svg>
        <svg id="SVG" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 566.93 137.35">
            <defs>
                <style>
                    .cls-1 {
                        fill: #009ee3;
                    }

                    .cls-1,
                    .cls-2,
                    .cls-3 {
                        fill-rule: evenodd;
                    }

                    .cls-2 {
                        fill: #113984;
                    }

                    .cls-3 {
                        fill: #172c70;
                    }
                </style>
            </defs>
            <title>paypal-seeklogo.com</title>
            <path class="cls-1" d="M192.95,386.87h38.74c20.8,0,28.63,10.53,27.42,26-2,25.54-17.44,39.67-37.92,39.67H210.85c-2.81,0-4.7,1.86-5.46,6.9L201,488.74c-0.29,1.9-1.29,3-2.79,3.15H173.87c-2.29,0-3.1-1.75-2.5-5.54l14.84-93.93C186.79,388.66,188.85,386.87,192.95,386.87Z"
                transform="translate(-143.48 -354.54)" />
            <path class="cls-2" d="M361.14,385.13c13.07,0,25.13,7.09,23.48,24.76-2,21-13.25,32.62-31,32.67H338.11c-2.23,0-3.31,1.82-3.89,5.55l-3,19.07c-0.45,2.88-1.93,4.3-4.11,4.3H312.68c-2.3,0-3.1-1.47-2.59-4.76L322,390.29c0.59-3.76,2-5.16,4.57-5.16h34.54Zm-23.5,40.92h11.75c7.35-.28,12.23-5.37,12.72-14.55,0.3-5.67-3.53-9.73-9.62-9.7l-11.06.05-3.79,24.2h0Zm86.21,39.58c1.32-1.2,2.66-1.82,2.47-.34l-0.47,3.54c-0.24,1.85.49,2.83,2.21,2.83h12.82c2.16,0,3.21-.87,3.74-4.21l7.9-49.58c0.4-2.49-.21-3.71-2.1-3.71H436.32c-1.27,0-1.89.71-2.22,2.65l-0.52,3.05c-0.27,1.59-1,1.87-1.68.27-2.39-5.66-8.49-8.2-17-8-19.77.41-33.1,15.42-34.53,34.66-1.1,14.88,9.56,26.57,23.62,26.57,10.2,0,14.76-3,19.9-7.7h0ZM413.11,458c-8.51,0-14.44-6.79-13.21-15.11s9.19-15.11,17.7-15.11,14.44,6.79,13.21,15.11S421.63,458,413.11,458h0Zm64.5-44h-13c-2.68,0-3.77,2-2.92,4.46l16.14,47.26L462,488.21c-1.33,1.88-.3,3.59,1.57,3.59h14.61a4.47,4.47,0,0,0,4.34-2.13l49.64-71.2c1.53-2.19.81-4.49-1.7-4.49H516.63c-2.37,0-3.32.94-4.68,2.91l-20.7,30L482,416.82C481.46,415,480.11,414,477.62,414Z"
                transform="translate(-143.48 -354.54)" />
            <path class="cls-1" d="M583.8,385.13c13.07,0,25.13,7.09,23.48,24.76-2,21-13.25,32.62-31,32.67H560.78c-2.23,0-3.31,1.82-3.89,5.55l-3,19.07c-0.45,2.88-1.93,4.3-4.11,4.3H535.35c-2.3,0-3.1-1.47-2.59-4.76l11.93-76.45c0.59-3.76,2-5.16,4.57-5.16H583.8Zm-23.5,40.92h11.75c7.35-.28,12.23-5.37,12.72-14.55,0.3-5.67-3.53-9.73-9.62-9.7l-11.06.05-3.79,24.2h0Zm86.21,39.58c1.32-1.2,2.66-1.82,2.47-.34l-0.47,3.54c-0.24,1.85.49,2.83,2.21,2.83h12.82c2.16,0,3.21-.87,3.74-4.21l7.9-49.58c0.4-2.49-.21-3.71-2.1-3.71H659c-1.27,0-1.89.71-2.22,2.65l-0.52,3.05c-0.27,1.59-1,1.87-1.68.27-2.39-5.66-8.49-8.2-17-8-19.77.41-33.1,15.42-34.53,34.66-1.1,14.88,9.56,26.57,23.62,26.57,10.2,0,14.76-3,19.9-7.7h0ZM635.78,458c-8.51,0-14.44-6.79-13.21-15.11s9.19-15.11,17.7-15.11,14.44,6.79,13.21,15.11S644.29,458,635.78,458h0Zm59.13,13.74h-14.8a1.75,1.75,0,0,1-1.81-2l13-82.36a2.55,2.55,0,0,1,2.46-2h14.8a1.75,1.75,0,0,1,1.81,2l-13,82.36A2.55,2.55,0,0,1,694.91,471.76Z"
                transform="translate(-143.48 -354.54)" />
            <path class="cls-2" d="M168.72,354.54h38.78c10.92,0,23.88.35,32.54,8,5.79,5.11,8.83,13.24,8.13,22-2.38,29.61-20.09,46.2-43.85,46.2H185.2c-3.26,0-5.41,2.16-6.33,8l-5.34,34c-0.35,2.2-1.3,3.5-3,3.66H146.6c-2.65,0-3.59-2-2.9-6.42L160.9,361C161.59,356.62,164,354.54,168.72,354.54Z"
                transform="translate(-143.48 -354.54)" />
            <path class="cls-3" d="M179.43,435.29l6.77-42.87c0.59-3.76,2.65-5.56,6.75-5.56h38.74c6.41,0,11.6,1,15.66,2.85-3.89,26.36-20.94,41-43.26,41H185C182.44,430.72,180.56,432,179.43,435.29Z"
                transform="translate(-143.48 -354.54)" />
        </svg>
        <input type="radio" name="MetodoPago" id="Paypal" checked="true" onchange="Rgb(1)">
        
      
        
    </div>
    {{foreach CargarCarrito}}
        <div class="BotonTramite">
            <button class="btnCompra" role="button" onclick="RealizarPedido({{ID}})">Comprar</button>
        </div>    
    {{endfor CargarCarrito}}

    {{endif Loggeado}}

    {{if NoLoggeado}}
    <div class="opciones">
        <label style="color: #181818;">Ingrese su usuario para continuar la compra</label>
    </div>
    <div class="ContenedorFormulario" style="margin: auto;">
        <form method="post" action="index.php?page=sec_login{{if redirto}}&redirto={{redirto}}{{endif redirto}}">
            <div class="Box">
                <h1>Libreria</h1>
                <p>Un buen libro es más que una piedra preciosa</p>
                <div class="Formulario">
                    <label for="txtEmail" style="color: #aaa;">Correo</label><br>
                    <input class="TextBox" type="email" id="txtEmail" name="txtEmail" value="{{txtEmail}}"><br>
                    {{if errorEmail}}
                    <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorEmail}}</div>
                    {{endif errorEmail}}


                    <label for="txtPswd" style="color: #aaa;">Contraseña</label><br>
                    <input type="password" class="TextBox" autocomplete="off" id="txtPswd" name="txtPswd"
                        value="{{txtPswd}}"><br>
                    {{if errorPswd}}
                    <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorPswd}}</div>
                    {{endif errorPswd}}
                    {{if generalError}}
                    <div class="row">
                        {{generalError}}
                    </div>
                    {{endif generalError}}
                    <a href="">Olvidaste la contraseña?</a>
                </div>

                <input type="submit" class="Boton" id="btnLogin" value="Entrar">
                <hr>
        </form>
        <p style="color: black;">Nuevo Lector? <a style="color: #3496db; text-decoration:underline;" id='Crear'
                onclick="Registro()">crea tu cuenta</a></p>
    </div>
    </div>
    {{endif NoLoggeado}}
    {{endif Cantidad}}

</section>
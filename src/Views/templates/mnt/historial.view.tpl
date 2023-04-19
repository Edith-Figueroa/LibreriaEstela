<section class="Filtro">
    <h2 style="margin: 0% 0%">Valor De Biblioteca: </h2>
    {{foreach Total}}
    <h3 style="margin: 0% 1%"> {{Total}}    .lps |</h3>
    {{endfor Total}}

    <h2 style="margin: 0% 0%">Cantidad De Libros: </h2>
    {{foreach TotalLibros}}
    <h3 style="margin: 0% 1%"> {{Total}}</h3>
    {{endfor TotalLibros}}
</section>

<section style="width: 95%; margin: 8% auto;">
    <table style="width: 100%;">
        <thead style="text-align: center; width: 300px; width: 300px;">
            <tr>
                <th>Libro</th>
                <th>Precio</th>
                <th>Fecha de compra</th>
            </tr>
        </thead>
        <tbody>
            {{foreach Historial}}
            <tr style="text-align: center;">
                <td>{{Titulo}}</td>
                <td>{{Precio}}</td>
                <td>{{Fecha}}</td>
            </tr>
            {{endfor Historial}}
        </tbody>
    </table>
</section>
<section class="Filtro">
    <center>
        <h2>Historial de Transacciones</h2>
    </center>
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
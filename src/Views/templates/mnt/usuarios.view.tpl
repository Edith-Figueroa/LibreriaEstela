<section class="depth-1">  
</section>
<section style="width: 95%; margin: 5% 0%;">
  <table style="width: 100%;" >
    <thead  style="text-align: center; width: 300px; width: 300px;">
      <tr>
      <th>Código</th>
      <th>Correo</th>
      <th>Estado</th>
      <th>
        {{if CanInsert}}
        <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" class="SVGProducts" onclick="location.href='index.php?page=mnt_usuario&mode=INS&id=0'"><path d="M18.708 28.333h2.75V21.5h6.875v-2.792h-6.875v-7.041h-2.75v7.041h-7.041V21.5h7.041ZM20 36.667q-3.458 0-6.479-1.313-3.021-1.312-5.292-3.583t-3.583-5.292Q3.333 23.458 3.333 20t1.313-6.5q1.312-3.042 3.583-5.292t5.292-3.562Q16.542 3.333 20 3.333t6.5 1.313q3.042 1.312 5.292 3.562t3.562 5.292q1.313 3.042 1.313 6.5t-1.313 6.479q-1.312 3.021-3.562 5.292T26.5 35.354q-3.042 1.313-6.5 1.313Zm0-2.792q5.792 0 9.833-4.042 4.042-4.041 4.042-9.833t-4.021-9.833Q25.833 6.125 20 6.125q-5.792 0-9.833 4.021Q6.125 14.167 6.125 20q0 5.792 4.042 9.833 4.041 4.042 9.833 4.042ZM20 20Z"/>                            
        {{endif CanInsert}}
      </th>
      </tr>
    </thead>
    <tbody>
      {{foreach Usuarios}}
      <tr style="text-align: center;">
        <td>{{usercod}}</td>
        <td>
          {{if ~CanView}}
          <a href="index.php?page=mnt_usuario&mode=DSP&id={{usercod}}">{{useremail}}</a>
          {{endif ~CanView}}

          {{ifnot ~CanView}}
              {{useremail}}
          {{endifnot ~CanView}}
        </td>
        <td>{{userest}}</td>
        <td>
          {{if ~CanUpdate}}   
            <span title="Editar Usuario">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="SVGProducts" id="btnEdit" onclick="location.href='index.php?page=mnt_usuario&mode=UPD&id={{usercod}}'"><path fill-rule="evenodd" d="M14.8024118,6.44526791 L8.69610276,12.549589 C8.29095108,12.9079238 8.04030835,13.4092335 8,13.8678295 L8,16.0029438 L10.0639829,16.004826 C10.5982069,15.9670062 11.0954869,15.7183782 11.4947932,15.2616227 L17.556693,9.19972295 L14.8024118,6.44526791 Z M16.2168556,5.0312846 L18.9709065,7.78550938 L19.8647941,6.89162181 C19.9513987,6.80501747 20.0000526,6.68755666 20.0000526,6.56507948 C20.0000526,6.4426023 19.9513987,6.32514149 19.8647932,6.23853626 L17.7611243,4.13485646 C17.6754884,4.04854589 17.5589355,4 17.43735,4 C17.3157645,4 17.1992116,4.04854589 17.1135757,4.13485646 L16.2168556,5.0312846 Z M22,13 L22,20 C22,21.1045695 21.1045695,22 20,22 L4,22 C2.8954305,22 2,21.1045695 2,20 L2,4 C2,2.8954305 2.8954305,2 4,2 L11,2 L11,4 L4,4 L4,20 L20,20 L20,13 L22,13 Z M17.43735,2 C18.0920882,2 18.7197259,2.26141978 19.1781068,2.7234227 L21.2790059,4.82432181 C21.7406843,5.28599904 22.0000526,5.91216845 22.0000526,6.56507948 C22.0000526,7.21799052 21.7406843,7.84415992 21.2790068,8.30583626 L12.9575072,16.6237545 C12.2590245,17.4294925 11.2689,17.9245308 10.1346,18.0023295 L6,18.0023295 L6,17.0023295 L6.00324765,13.7873015 C6.08843822,12.7328366 6.57866679,11.7523321 7.32649633,11.0934196 L15.6953877,2.72462818 C16.1563921,2.2608295 16.7833514,2 17.43735,2 Z" /></svg></span>                        
          {{endif ~CanUpdate}}          
          {{if ~CanView}}
            <span title="Historia De Trasacciones" onclick="Historial({{usercod}})"><svg xmlns="http://www.w3.org/2000/svg" height="40" viewBox="0 96 960 960" width="40" class="SVGProducts"><path d="M480 936q-151 0-255.5-46.5T120 776V376q0-66 105.5-113T480 216q149 0 254.5 47T840 376v400q0 67-104.5 113.5T480 936Zm0-485q87 0 177.333-26.167Q747.667 398.666 768.667 367 747 336 656.833 309.333 566.667 282.666 480 282.666q-89 0-177.5 25.834Q214 334.333 190.666 367 214 400.333 301.833 425.667 389.667 451 480 451Zm-.667 209q42 0 83-4.333 41-4.334 78.5-12.834 37.501-8.5 71.334-20.833 33.833-12.333 61.167-27.667V450.999q-28 15.334-61.834 27.667-33.833 12.333-71.667 20.833-37.833 8.5-78.166 13.167-40.334 4.667-82.334 4.667T396 512.666q-41.333-4.667-78.833-13.167-37.501-8.5-70.834-20.833-33.333-12.333-59.667-27.667v143.334Q213 609.667 246 622q33 12.333 70.5 20.833 37.5 8.5 78.833 12.834 41.334 4.333 84 4.333ZM480 869.334q47.333 0 97.167-8 49.833-8 91.5-21.167Q710.334 827 739 810.833q28.667-16.166 34.334-33.166V661.666Q746 677 712.167 689t-71.334 20.5q-37.5 8.5-78.166 12.833-40.667 4.333-83.334 4.333-42.666 0-84-4.333Q354 718 316.5 709.5T246 689q-33-12-59.334-27.334v117.001q5 16.333 33.167 32.666Q248 827.667 290 840.5q42 12.834 92 20.834t98 8Z"/></svg>
            </span>
            <span title="Editar Usuario"><svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" class="SVGProducts" id="btnEdit" onclick="location.href='index.php?page=mnt_usuario&mode=UPD&id={{usercod}}'"><path d="M7.792 32.208h2l17.083-17.083-2-2L7.792 30.208Zm25-19.083L26.875 7.25l1.917-1.958q.791-.792 1.958-.792 1.167 0 1.958.792l2 2q.792.791.813 1.937.021 1.146-.771 1.938Zm-2 2L10.917 35H5v-5.917L24.875 9.208Zm-4.917-1-1-1 2 2Z"/></svg></span>                        
          {{endif ~CanUpdate}}          
          {{if ~CanView}}
            <span title="Historia De Trasacciones" onclick="Historial({{usercod}})"><svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" class="SVGProducts"><path d="M9.5 36.667q-1.917 0-3.25-1.334Q4.917 34 4.917 32.083v-5.125h5.208V3.333l2.5 2.5 2.458-2.5 2.5 2.5 2.5-2.5 2.5 2.5 2.5-2.5 2.5 2.5 2.5-2.5 2.5 2.5 2.5-2.5v28.75q0 1.917-1.333 3.25-1.333 1.334-3.25 1.334Zm21-2.792q.792 0 1.292-.5t.5-1.292V7.792H12.875v19.166h15.833v5.125q0 .792.5 1.292t1.292.5Zm-15.583-19.5v-2.75h10v2.75Zm0 5.417V17h10v2.792Zm13.708-5.417q-.583 0-1-.396-.417-.396-.417-.979t.417-.979q.417-.396 1-.396.542 0 .958.396.417.396.417.979t-.417.979q-.416.396-.958.396Zm0 5.25q-.583 0-1-.396-.417-.396-.417-.979t.417-.979q.417-.396 1-.396.542 0 .958.396.417.396.417.979t-.417.979q-.416.396-.958.396ZM9.458 33.875h16.459v-4.167H7.708v2.375q0 .792.5 1.292t1.25.5Zm-1.75 0v-4.167 4.167Z"/></svg></span>
          {{endif ~CanView}}
        </td>
      </tr>
      {{endfor Usuarios}}
    </tbody>
  </table>
</section>
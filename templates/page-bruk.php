
      <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBAWOrHQtHS5g83a6cidtLhvlikg9WpNmI&sensor=true"></script>
    <script type="text/javascript">
      var markers = [
        ['<h2 style="margin:0;">Bruk 1, Lindum Gård</h2><p>Lindumveien 48, 3036 Drammen', 59.687383, 10.256372],
        ['<h2 style="margin:0;">Bruk 15, Øvre Lindum</h2><p>Lerpeveien 136, 3036 Drammen', 59.690228, 10.267143],
        ['<h2 style="margin:0;">Bruk 2, Østengen</h2><p>Lerpeveien 155, 203 A, 3036 Drammen', 59.688342, 10.270719],
        ['<h2 style="margin:0;">Bruk 3, Lindum</h2><p>Lerpeveien 176, 3036 Drammen', 59.689572, 10.268410],
        ['<h2 style="margin:0;">Bruk 4, Lindum</h2><p>Gamle Sørlandske 264, 3036 Drammen', 59.685706, 10.252580],
        ['<h2 style="margin:0;">Bruk 9, Nedre Lindum</h2><p>Gamle Sørlandske 228, 3036 Drammen', 59.688929, 10.251318],
        ['<h2 style="margin:0;">Bruk 20, Alfheim</h2><p>Gamle Sørlandske 219, 3036 Drammen', 59.690559, 10.255868],
      ];
      function initialize() {
        var mapOptions = {
          center: new google.maps.LatLng(59.687383, 10.256372),
          zoom: 13
        };
        var map = new google.maps.Map(document.getElementById("brukskart"),
            mapOptions);

        var infowindow = new google.maps.InfoWindow(), marker, i;
        var bounds = new google.maps.LatLngBounds();
        for (i = 0; i < markers.length; i++) {  
            var pos = new google.maps.LatLng(markers[i][1], markers[i][2]);
            bounds.extend(pos);
            marker = new google.maps.Marker({
                position: pos,
                map: map
            });
            google.maps.event.addListener(marker, 'click', (function(marker, i) {
                return function() {
                    infowindow.setContent(markers[i][0]);
                    infowindow.open(map, marker);
                }
            })(marker, i));
        }

        var infobruk1 = new google.maps.InfoWindow({
              content: '<h2 style="margin:0;">Bruk 1, Lindum Gård</h2>'+
        '<p>Lindumveien 48, 3036 Drammen'
          });
        var infobruk15 = new google.maps.InfoWindow({
              content: '<h2 style="margin:0;">Bruk 1, Lindum Gård</h2>'+
        '<p>Lindumveien 48, 3036 Drammen'
          });
          map.fitBounds(bounds);
      }
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>


  <div class="content">
    <article>
      <header>
        <?php echo $page->getBreadcrumbs(); ?>
        <h1 class="entry-title">Ulike bruk fra Lindum Gård</h1>
      </header>
      
      <div id="brukskart"></div>

      <h2>Bruk nr 1</h2>
      <p>Selve "Hovedgården", Lindumgård, som nå befinner seg ved lindumveien 48. Dette bruket ble skilt ut av Lindumgård og solgt av Nils Persønn til John Larssøn (Hans svigersønn, gift med Maren Nilsdatter).</p>

      <h2>Bruk nr 2</h2>
      <p>Dette bruket ble skilt ut av bruk 1 i 1850. Eieren var Jørgen Johnsen, etterfulgt av Halvor Christoffersen Juel.</p>

      <h2>Bruk nr 3</h2>
      <p>Når hele gården var et samlet bruk var det her boplassen var. Den ble i 1864 utskilt fra bruk 1 av Anders Christoffersen Juel og overtatt av Otto Andreas Halvorsen Juel</p>

      <h2>Bruk nr 4</h2>
      <p>Ble skilt ut av Anders Christoffersen Juel den 4 februar 1864, sammen med bruk 3.</p>

      <h2>Bruk nr 9</h2>
      <p>Dette bruket ble skilt ut av bruk 1, og er sammensatt av flere mindre tidligere utskilte bruk. Hoveddelen av denne ble kjøpt i 1873, og det ble da bruk nr 9.</p>

      <h2>Bruk nr 15</h2>
      <p>Dette var det andre store bruket som ble skilt ut av lindumgård i 1708. Brukets første eier var Per Peterssønn (gift med Ingeborg Nilsdatter)</p>
      
      <h2>Bruk nr 20</h2>
      <p>Et mindre bruk skilt ut på begynnelsen av 1900-tallet, og "våningshuset" ble bygget i 1913, etterfulgt av sidebygning med drengstue i 1928</p>
    </article>
  </div>
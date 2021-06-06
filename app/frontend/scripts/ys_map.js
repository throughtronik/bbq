document.addEventListener('DOMContentLoaded', function () {
    ymaps.ready(init);
    var myMap;

    let map_div_included = document.getElementById('map');

    function init() {
        
        if (!map_div_included){
            return;
        };

        address = document.getElementById('map').getAttribute('data-address');

        if (address == null) {
            return
        };

        myMap = new ymaps.Map("map", {
            center: [55.76, 37.64],
            zoom: 10
        });

        myGeocoder = ymaps.geocode(address);

        myGeocoder.then(
            function (res) {
                coordinates = res.geoObjects.get(0).geometry.getCoordinates();

                myMap.geoObjects.add(
                    new ymaps.Placemark(
                        coordinates,
                        {iconContent: address},
                        {preset: 'islands#blueStretchyIcon'}
                    )
                );

                myMap.setCenter(coordinates);
                myMap.setZoom(15);
            }, function (err) {
                alert('Ошибка при определении местоположения');
            }
        );
    }
})
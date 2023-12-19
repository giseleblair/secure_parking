
<section class="car-park-detail park-search-results">
    <div class="car-park-detail__left">
        {{ include /misc/status-bar }}
        {{ include search-park-input }}
  
        <div class="wrapper-map-left">
            <section class="car-park-search-results">
                {{ include /car-park-search-components/car-park-search-wrapper }}
            </section>
        </div>
    </div>
    <div class="car-park-detail__right" data-searchshowid="search-results-container">
        <div class="car-park-detail__map">
            <div class="map"></div>
        </div>
    </div>
</section>
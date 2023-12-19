<section class="carpark__search-wrapper">
    <div class="title">
        When would you like to park?
    </div>
    {{ include /search-results/near-me-tile }}
    <section class="parks-results active" data-searchShowId="autocomplete-results-desktop">
        {{ include /search-results/desktop-parks-results }}
    </section>
    {{ include search-product-tabs }}
    {{ include /car-park-search-components/search-components-wrapper }}
    
    <section class="search-results-container-wrapper" data-searchShowId="search-results-container">
        {{ include search-results-container }}
    </section>

    {{ include /booking/booking-review-partial }}
    {{ include /booking/booking-succesful }}
    {{ include /booking/booking-single-button-wrapper }}
</section>
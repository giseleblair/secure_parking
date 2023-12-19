<div class="car-park-search-results__container" style="left: 0;">
    <div class="wrapper">
        <div class="car-park-search-results__divider-wrapper">
            <div class="car-park-search-results__divider"></div>
        </div>
        <div class="car-park-search-results__title car-park-search-results__title--mobile">
            <h1>Where would you like to park?</h1>
        </div>

        <div class="parking-tabs">
            <div class="parking-tabs__tabs">
                <div class="parking-tabs__tab closest">Closest</div>
                <div class="parking-tabs__tab cheapest">Best Price</div>
            </div>
            <div class="parking-tabs__items closest">
            </div>
            <!-- past items -->
            <div class="parking-tabs__items cheapest hidden">
            </div>
            <div class="parking-tabs__no-results carpark-no-results" style="display: none;">No results available with your selected filters</div>
            {{ include /misc/loader }}
        </div>
    </div>
</div>
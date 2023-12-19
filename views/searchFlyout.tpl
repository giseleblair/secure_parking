<section class="search-widget site-panel " data-site-panel="search">
    <div class="search-widget__upper">
        <div class="breadcrumb internal" style="display:none;">
            <span></span>
            <p>Back</p>
        </div>
        <div class="search-widget__container">
            <div class="search-widget__title">Search Secure Parking</div>
            <div class="search-widget__input-wrapper">
                <div class="search-widget__search search-widget__search--white search-widget__search--internal">
                    <span class="search-widget__search-icon"></span>
                    <input placeholder="Search">
                </div>
            </div>
            <div class="search-widget__button-wrapper">
                <div class="primary-btn primary-btn--light">
                    <a href="{{$langPrefix}}/faqs/">FAQ's</a>
                </div>
                <div class="primary-btn primary-btn--light">
                    <a href="{{$langPrefix}}/offers-and-events/">Offers &amp; Events</a>
                </div>
                <div class="primary-btn primary-btn--light">
                    <a href="{{$langPrefix}}/car-parks/">Find a Park</a>
                </div>
            </div>
        </div>
    </div>
    <div id="content-search-results" class="search-widget__results" style="display:none">
        <div class="search-widget__container">            
            <div class="loader internal text-center" style="display:none">
                <div class="lds-ripple">
                    <div></div>
                    <div></div>
                </div>
            </div>
            <div class="search-widget__filters">
                <div class="search-widget__empty-term"></div>
                <div class="search-widget__clear-all">Clear<span style="background-image: url('https://24twnq5l.media.zestyio.com/grey-close-sign.svg')"></span></div>
            </div>
            <div class="items">
            </div>
        </div>
    </div>

    <div class="search-widget__lower">
        <div class="breadcrumb parks" style="display:none;">
            <span></span>
            <p>Back</p>
        </div>
        <div class="search-widget__container">
            <div class="search-widget__title search-widget__title--white">Find a park</div>
            <div class="search-widget__input-wrapper">
                <div class="search-widget__search search-widget__search--parks">
                    <span class="search-widget__search-icon"></span>
                    <input placeholder="Search for a city, address or business" class="find-park-input" data-context="sidebar">
                </div>
            </div>
        </div>
        <div class="results"> </div>
    </div>
    <div class="loader parks text-center" style="display:none" data-context="sidebar">
        <div class="lds-ripple">
            <div></div>
            <div></div>
        </div>
    </div>
    <div id="parks-search-results" class="search-widget__results" style="display:none">
        <div class="search-widget__container" data-context="sidebar">

            <div class="items">
                <div class="geocode-results"></div>
                <h3 class="search-widget__subtitle" style="padding-top: 2rem; padding-left: 2rem;">Car Parks</h3>
                <div class="carpark-results-container"></div>
            </div>
        </div>
    </div>
</section>


<script>


    </script>
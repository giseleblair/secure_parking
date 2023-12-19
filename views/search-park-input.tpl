<div class="grey-section bg-secondary">
    <div class="wrapper-map-left input-wrapper">
        <p class="grey-section__title">Find a car park</p>
        <section class="search-park-input">

            <div class="search-park-input__search">
                <span class="search-park-input__search-icon glass active"></span>
                <span class="search-park-input__search-icon back-arrow"></span>
                <input placeholder="Find a Park" class="find-park-input" data-context="main">
                <div class="search-park-input__filters-wrapper">
                    <span class="search-park-input__filters"></span>
                    <span class="search-park-input__number"></span>
                </div>
                <div class="search-park-input__summary">
                    <div class="date"></div>
                    <div class="duration"></div>
                </div>
            </div>
        </section>
         <div class="results"></div>
         {{ include search-filters }}
    </div>
</div>
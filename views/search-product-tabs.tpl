<section class="search-type-result" data-searchShowId="search-booking-type">
    <div class="wrapper-map-left">
        <a class="cta-light-blue skip-to-results" href="{{$langPrefix}}/">Skip to results<span></span></a>
        <div class="search-type-result__items">
            {{ each product_tab as tab order by tab.sort asc }}  
            <div class="search-type-result__item" data-product-type="{{tab.product_type}}">
                <div class="search-type-result__info">
                    <div class="search-type-result__icon search-type-result__icon--{{tab.product_type}}"    {{if {tab.tab_icon.getImage()} != ''}} style="background-image: url('{{tab.tab_icon.getImage()}}');" {{end-if}}></div>
                    <div class="search-type-result__title">{{tab.tab_name}}</div>
                </div>
                <div class="search-type-result__desc">{{tab.tab_description}}</div>
                
            </div>
            {{ end-each }}
        </div>
    </div>
</section>
<section class="home__products bg-white">
    <div class="wrapper">
        <div class="home__heading-wrapper">
            <h2 class="home__heading">{{ this.products_title }}</h2>
             {{if {this.product_more_cta} != ''}}
                <a class="home__cta-mobile cta-light-blue" href="{{truepath({this.product_more_cta})}}" title="{{ this.product_cta_text }}">
                    {{ this.product_cta_text }}
                <span></span>
                </a>
             {{ end-if }}
        </div>

         <p class="news-listing__body-copy-featured">{{this.products_description}}</p>

        <div class="search-type-result__items">
            {{ each product_categories as tab order by tab.sort_order asc }}
                {{ $tablink = "" }}
                {{ if {tab.link_to_page} != ''}}
                    {{$tablink = {truepath({tab.link_to_page})} }}
                {{ else}}
                    {{ $tablink = {tab.external_link} }}
                {{ end-if }}

                <a href="{{$tablink}}">
                    <span class="search-type-result__item">
                        <span class="search-type-result__info">
                            <span class="search-type-result__icon search-type-result__icon--allday" {{if {tab.category_icon.getImage()} !='' }} style="background-image: url('{{tab.category_icon.getImage()}}');" {{end-if}}></span>
                            <span class="search-type-result__title">{{tab.title}} Parking</span>
                        </span>
                        <span class="search-type-result__desc">{{tab.description}}</span>
                    </span>
                </a>            
            {{ end-each }}
        </div>
    </div>

    {{if {this.product_more_cta} != ''}}
    <div class="wrapper text-center home__cta">
        <div class="primary-btn">
           <a href="{{truepath({this.product_more_cta})}}">{{ this.product_cta_text }}</a> 
        </div>
    </div>
    {{ end-if }}
     
</section>
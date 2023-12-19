<section class="deals-listing booking-details-events">
    <div class="wrapper">
        <div class="home__heading-wrapper">
            <h2 class="home__heading">{{ this.offers_title }}</h2>

            {{if {this.offers_cta} != ''}}
            <a class="home__cta-mobile cta-light-blue" href="{{truepath({this.offers_cta})}}" title="{{ this.offers_cta_text}}">{{ this.offers_cta_text}}
                <span></span>
            </a>
            {{ end-if }}

        </div>

        <p class="news-listing__body-copy-featured">{{this.offers_description}}</p>

        <div class="deals-listing__container">

            {{each offer_item as item where find_in_set(item.zuid,'{this.related_home_offers}') order by item.sort }} {{ $dealType = {item.offer_or_event} }}
            <a class="deals-listing__anchor" href="{{item.getUrl()}}">
                <div class="deals-listing__item">
                    <div class="deals-listing__img-wrapper">
                        {{if {item.deal_image.getImage()} != ''}}
                        <picture>
                            <source srcset="{{item.deal_image.getImage()}}?width=700&crop=1:1" media="(max-width: 599px)" />
                            <source srcset="{{item.deal_image.getImage()}}?width=1400&crop=1:1" media="(min-width: 600px)" />
                            <img src="{{item.deal_image.getImage()}}?width=700&crop=1:1" />
                        </picture>
                        {{end-if}}
                    </div>
                    <div class="deals-listing__content-wrapper">
                        <h2 class="item-title">{{ item.title }}</h2>
                    </div>
                </div>
            </a>
            {{ end-each }}


        </div>

        {{if {this.offers_cta} != ''}}
        <div class="wrapper text-center home__cta">
            <div class="primary-btn">
            <a href="{{truepath({this.offers_cta})}}">{{ this.offers_cta_text}}</a> 
            </div>
        </div>
        {{ end-if }}

    </div>

</section>
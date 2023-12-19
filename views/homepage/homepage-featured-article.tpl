<div class="wrapper">
    <div class="news-listing__item news-listing__item--featured">
        <div class="img-wrapper">
            <div class="img-container">
                {{if {this.featured_item_image.getImage()} != ''}}

                <picture>
                    <source srcset="{{this.featured_item_image.getImage()}}?width=700&crop=3:2" media="(max-width: 599px)" />
                    <source srcset="{{this.featured_item_image.getImage()}}?width=1400&crop=3:2" media="(min-width: 600px)" />
                    <img src="{{this.featured_item_image.getImage()}}?width=700&crop=3:2" alt="featured article image" />
                </picture>

                {{end-if}}
            </div>
        </div>
        <div class="content-wrapper">
            <h3 class="tag">{{this.featured_item_type}}</h3>
            <h2 class="news-listing__title-featured">{{this.featured_item_title}}</h2>
            <p class="news-listing__body-copy-featured">{{ this.featured_item_description }}</p>


            {{if {this.featured_item_cta} != ''}}

            <a class="cta-light-blue" href="{{truepath({this.featured_item_cta})}}">{{ this.featured_item_cta_text}}<span></span></a> {{ end-if }}

        </div>
    </div>
</div>
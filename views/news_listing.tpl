<section class="news-listing">
    <div class="wrapper">
        <h1>{{this.title}}</h1>
    </div>
    <div class="wrapper">
        <div class="news-listing__container">

   {{if {this.show_featured_article} == 1}}

            <div class="news-listing__item news-listing__item--featured">
                <div class="img-wrapper">
                     <div class="img-container">
                    {{if {this.featured_article_image.getImage()} != ''}}

                    <picture>
                        <source srcset="{{this.featured_article_image.getImage()}}?width=700&crop=3:2" media="(max-width: 599px)" />
                        <source srcset="{{this.featured_article_image.getImage()}}?width=1400&crop=3:2" media="(min-width: 600px)" />
                        <img src="{{this.featured_article_image.getImage()}}?width=700&crop=3:2" alt="featured article image"/>
                    </picture>
                    {{end-if}}
                </div>
            </div>
                <div class="content-wrapper">
                    <h3 class="tag">Featured article</h3>
                    <h2 class="news-listing__title-featured">{{this.featured_article_title}}</h2>
                    <p class="news-listing__body-copy-featured">{{this.featured_article_description}}</p>

                    {{if {this.featured_article_cta} != ''}}
                    <a class="cta-light-blue" href="{{truepath({this.featured_article_cta})}}">{{this.featured_article_cta_text}}<span></span></a> {{ end-if }}

                </div>

            </div>
            
    {{ end-if }}


        {{ $show = {this.show} }} 
        {{ if {get_var.p} }} 
            {{ $show = {math({$show} + {get_var.p})} }} 
        {{ end-if }} 
        {{ each news_article as newsCounter where newsCounter.parent_zuid = '{page.zuid}'}} 
            {{ $totalSize = {newsCounter._length} }} 
        {{ end-each }} 
        {{ each news_article as news where news.parent_zuid = '{page.zuid}' limit {$show} order by news.sort}}

        <a class="news-listing__anchor" href="{{news.getUrl()}}">
            <div class="news-listing__item">
                <div class="news-listing__img-wrapper">
 {{if {news.article_image.getImage()} != ''}}
                    <picture>
                        <source srcset="{{news.article_image.getImage()}}?width=700&crop=3:2" media="(max-width: 599px)" />
                        <source srcset="{{news.article_image.getImage()}}?width=1400&crop=3:2" media="(min-width: 600px)" />
                        <img src="{{news.article_image.getImage()}}?width=700&crop=3:2" />
                    </picture>
                    {{end-if}}
                </div>

                <div class="news-listing__content-wrapper">
                    <h2 class="item-title">{{news.title}}</h2>
                    <p class="body-copy">{{news.description}}</p>
                </div>

            </div>
        </a>

            {{ $currentSize = {news._length} }} {{ end-each }}
        </div>
        {{ if {$totalSize} > {$currentSize} }}

        <div class="wrapper text-center">
            <div class="primary-btn"><a class="button" href="{{ page.getUrl() }}?p={{$show}}">Show more</a></div>
        </div>
        {{ end-if }}


</section>
<section class="news-article">
    <div class="wrapper">
        <div class="news-article__heading">
            <div class="news-article__subtitle">{{breadcrumbs(0,>)}}</div>
            <div class="news-article__share"></div>

        </div>
    </div>
    <div class="news-article__item">
        {{if {this.article_image.getImage()} != ''}}
            <div class="wrapper">
                <div class="news-article__banner">
                    <div class="news-article__img-wrapper">
                        
                    <picture>
                        <source srcset="{{this.article_image.getImage()}}?width=700&crop=3:2" media="(max-width: 599px)" />
                        <source srcset="{{this.article_image.getImage()}}?width=1400&crop=14:6" media="(min-width: 600px)" />
                        <img src="{{this.article_image.getImage()}}?width=700&crop=14:6" />
                    </picture>
                    </div>
                </div>
            </div>
        {{end-if}}
        <div class="wrapper">
            <div class="news-article__title-wrapper">
                <h1 class="news-article__title">{{this.title}}</h1>
            </div>
        </div>

        <div class="bg-white">
            <div class="wrapper">
                <div class="news-article__content">

                    {{this.content.replace(href="(?!(http|mailto|tel)).*?, href="{$langPrefix}$1) }}
                </div>
            </div>
        </div>
    </div>
</section>